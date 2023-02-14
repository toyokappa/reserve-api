class Customer::PurchasesController < Customer::ApplicationController
  def index
    # TODO: 制限に引っかかったプロダクトを表示しないように実装
    @product_sets = ProductSet.all.includes(:product_assigns, :product_items)
  end

  def show
    @product_set = ProductSet.includes(:product_assigns, :product_items).find(params[:id])
    @main_product = @product_set.product_assigns.find_by(is_main: true)
  end

  def create
    Payjp.api_key = ENV['PAYJP_API_TOKEN']
    # 顧客を作成
    ActiveRecord::Base.transaction do
      # payjp_customer = Payjp::Customer.create(
      #   card: card_params[:token],
      #   email: current_customer.email,
      #   description: current_customer.full_name
      # )

      # if current_customer.payjp_customer.blank?
      #   current_customer.create_payjp_customer!(uid: payjp_customer.id)
      # end
      # # 決済処理を実行
      # Payjp::Charge.create(
      #   amount: payment_params[:amount],
      #   description: payment_params[:description],
      #   currency: 'jpy',
      #   customer: payjp_customer.id
      # )

      # 購入履歴の作成
      # チケットの付与
      expiration = Time.current.end_of_day + ticket_params[:days_of_expiration].days
      ticket_attrs = ticket_params[:number_of_item].times.map do
        {
          product_set_id: ticket_params[:product_id],
          name: ticket_params[:name],
          expiration: expiration,
        }
      end
      current_customer.tickets.insert_all!(ticket_attrs)
    end
  end

  private

  def card_params
    params.require(:card).permit(:token)
  end

  def payment_params
    params.require(:payment).permit(:amount, :description)
  end

  def ticket_params
    params.require(:ticket).permit(:product_id, :name, :number_of_item, :days_of_expiration)
  end
end