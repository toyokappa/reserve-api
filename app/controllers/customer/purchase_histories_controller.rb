class Customer::PurchaseHistoriesController < Customer::ApplicationController
  def index
    @histories = current_customer.purchase_histories.order(purchased_at: :desc)
  end

  def show
    @history = current_customer.purchase_histories.find(params[:id])
  end
end