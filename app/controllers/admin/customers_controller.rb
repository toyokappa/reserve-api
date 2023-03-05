class Admin::CustomersController < Admin::ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @assign_groups = @customer.customer_groups
    @unassign_groups = CustomerGroup.where.not(id: @assign_groups)
  end
end