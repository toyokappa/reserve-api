class Customer::PurchasesController < Customer::ApplicationController
  def index
    limited_product_ids = current_customer.customer_groups.includes(:product_sets).where(product_sets: { publish_state: :limited }).pluck(:product_set_id)
    product_published = ProductSet.published.includes(:product_assigns, :product_items)
    product_published = product_published.or(ProductSet.where(id: limited_product_ids))

    purchase_count = current_customer.purchase_histories.group(:product_set_id).count
    @product_sets = product_published.filter do |product|
      next true unless product.has_purchase_limit?
      next true unless purchase_count[product.id]

      purchase_count[product.id] < product.purchase_limit
    end
  end

  def show
    Payjp.api_key = ENV['PAYJP_API_TOKEN']

    @product_set = ProductSet.includes(:product_assigns, :product_items).find(params[:id])
    @main_product = @product_set.product_assigns.find_by(is_main: true)
    @has_usable_coupons = @product_set.coupons.usable(current_customer).present?
    if current_customer.payjp_customer.present?
      customer = Payjp::Customer.retrieve(current_customer.payjp_customer.uid)
      @card = customer.cards.retrieve(customer.default_card)
    end
  end

  def create
    Payjp.api_key = ENV['PAYJP_API_TOKEN']
    # 顧客を作成
    ActiveRecord::Base.transaction do
      if current_customer.payjp_customer.blank?
        payjp_customer = Payjp::Customer.create(
          card: purchase_params[:card_token],
          email: current_customer.email,
          description: current_customer.full_name
        )

        current_customer.create_payjp_customer!(uid: payjp_customer.id)
      end

      product_set = ProductSet.find(purchase_params[:product_set_id])
      coupon = product_set.coupons.usable(current_customer).find_by(id: purchase_params[:coupon_id])
      total_amount = product_set.total_amount
      total_amount = total_amount - coupon.discount_amount if coupon.present?

      # 決済処理を実行
      charge = Payjp::Charge.create(
        amount: total_amount,
        description: product_set.name,
        currency: 'jpy',
        customer: current_customer.payjp_customer.uid
      )

      coupon.customers << current_customer if coupon.present?

      # 購入履歴の作成
      purchase_history = current_customer.purchase_histories.create!(
        product_set_name: product_set.name,
        total_amount: total_amount,
        payment_method: :card, # TODO: カード以外の実装が必要なときはここを書き換える
        purchased_at: Time.current,
        card_number: charge.card.last4,
        card_brand: charge.card.brand,
        card_expiration: "#{format('%02<month>d', month: charge.card.exp_month)}/#{charge.card.exp_year}",
        card_owner: charge.card.name,
        payjp_charge_uid: charge.id,
        payjp_card_uid: charge.card.id,
        product_set: product_set,
        coupon: coupon,
        meta: {
          product_set: product_set,
          coupon: coupon,
          payjp_charge: charge,
        }
      )

      pd_attrs = product_set.product_assigns.map do |pa|
        {
          product_name: pa.is_main? ? product_set.name : pa.product_item.name,
          amount: pa.price,
          product_assign_id: pa.id,
          coupon_id: nil,
          meta: {
            product_assign: pa,
            product_item: pa.product_item,
          }
        }
      end
      if coupon.present?
        pd_attrs << {
          product_name: coupon.name,
          amount: -coupon.discount_amount,
          product_assign_id: nil,
          coupon_id: coupon.id,
          meta: {
            coupon: coupon,
          }
        }
      end
      purchase_history.purchase_details.insert_all!(pd_attrs)

      # チケットの付与
      main_product = product_set.product_assigns.find_by(is_main: true)
      expiration = Time.current.end_of_day + main_product.days_of_expiration.days
      ticket_attrs = main_product.number_of_item.times.map do
        {
          product_set_id: product_set.id,
          name: product_set.name,
          expiration: expiration,
        }
      end
      current_customer.tickets.insert_all!(ticket_attrs)

      # メール送信
      Customer::PurchaseMailer.with(
        to: current_customer.email,
        name: current_customer.full_name,
        product_name: purchase_history.product_set_name,
        purchased_at: purchase_history.purchased_at.to_fs,
        total_amount: purchase_history.total_amount.to_fs(:delimited),
        payment_method: purchase_history.payment_method_i18n,
      ).complete.deliver_now
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(
      :product_set_id,
      :coupon_id,
      :card_token
    )
  end
end