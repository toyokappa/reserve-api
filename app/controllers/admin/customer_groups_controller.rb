class Admin::CustomerGroupsController < Admin::ApplicationController
  def create
    group = CustomerGroup.find(group_params[:group_id])
    customer = Customer.find(group_params[:customer_id])
    group.customers << customer
    @assigned_groups = customer.customer_groups
    @unassigned_groups = CustomerGroup.where.not(id: @assigned_groups)
  end

  def destroy
    group = CustomerGroup.find(group_params[:group_id])
    customer = Customer.find(group_params[:customer_id])
    group.customers.destroy(customer)
    @assigned_groups = customer.customer_groups
    @unassigned_groups = CustomerGroup.where.not(id: @assigned_groups)
  end

  private

  def group_params
    params.require(:group).permit(:group_id, :customer_id)
  end
end