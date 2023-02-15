class Customer::PurchasesController < Customer::ApplicationController
  def index
    # TODO: 制限に引っかかったプロダクトを表示しないように実装
    @product_sets = ProductSet.all.includes(:product_assigns, :product_items)
  end

  def show
    Payjp.api_key = ENV['PAYJP_API_TOKEN']

    @product_set = ProductSet.includes(:product_assigns, :product_items).find(params[:id])
    @main_product = @product_set.product_assigns.find_by(is_main: true)
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

      # 決済処理を実行
      charge = Payjp::Charge.create(
        amount: product_set.total_amount,
        description: product_set.name,
        currency: 'jpy',
        customer: current_customer.payjp_customer.uid
      )

      # 購入履歴の作成
      purchase_history = current_customer.purchase_histories.create!(
        product_set_name: product_set.name,
        total_amount: product_set.total_amount,
        payment_method: :card, # TODO: カード以外の実装が必要なときはここを書き換える
        purchased_at: Time.current,
        payjp_charge_uid: charge.id,
        payjp_card_uid: charge.card.id,
        product_set: product_set,
        meta: {
          product_set: product_set,
          payjp_charge: charge,
        }
      )

      pd_attrs = product_set.product_assigns.map do |pa|
        {
          product_name: pa.is_main? ? product_set.name : pa.product_item.name,
          amount: pa.price,
          product_assign_id: pa.id,
          meta: {
            product_assign: pa,
            product_item: pa.product_item
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
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(
      :product_set_id,
      :card_token
    )
  end
end