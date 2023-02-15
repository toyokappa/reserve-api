class Customer::PurchaseHistoriesController < Customer::ApplicationController
  def index
    @histories = current_customer.purchase_histories.order(purchased_at: :desc)
  end
end