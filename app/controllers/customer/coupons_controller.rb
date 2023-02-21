class Customer::CouponsController < Customer::ApplicationController
  def show
    product_set = ProductSet.find(params[:product_set_id])
    @coupon = product_set.coupons.usable(current_customer).find_by(code: params[:code])
  end
end