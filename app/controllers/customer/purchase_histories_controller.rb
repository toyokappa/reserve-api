class Customer::PurchaseHistoriesController < Customer::ApplicationController
  def index
    @histories = current_customer.purchase_histories.order(purchased_at: :desc)
  end

  def show
    Payjp.api_key = ENV['PAYJP_API_TOKEN']

    @history = current_customer.purchase_histories.find(params[:id])
    customer = Payjp::Customer.retrieve(current_customer.payjp_customer.uid)
    @card = customer.cards.retrieve(@history.payjp_card_uid)
  end
end