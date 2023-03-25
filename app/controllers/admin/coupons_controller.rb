class Admin::CouponsController < Admin::ApplicationController
  def index
    @coupons = Coupon.all
  end

  def show
    @coupon = Coupon.find(params[:id])
    @assigned_products = @coupon.product_sets
    @unassigned_products = ProductSet.where.not(id: @assigned_products)
  end

  def create
    coupon = Coupon.create!(coupon_params)
  end

  def update
  end

  def destroy
  end

  private

  def coupon_params
    params.require(:coupon).permit(
      :name,
      :code,
      :expiration,
      :use_limit,
      :discount_amount,
    )
  end
end