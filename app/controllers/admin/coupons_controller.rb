class Admin::CouponsController < Admin::ApplicationController
  def index
    @coupons = Coupon.all
  end

  def show
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