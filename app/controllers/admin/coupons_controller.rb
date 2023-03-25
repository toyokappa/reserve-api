class Admin::CouponsController < Admin::ApplicationController
  def index
    @coupons = Coupon.all
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end