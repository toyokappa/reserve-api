class Staff::CustomersController < Staff::ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @training_logs = @customer.training_logs.order(logged_at: :desc)
    @body_metrics_logs = @customer.body_metrics_logs.order(logged_at: :desc)
  end
end