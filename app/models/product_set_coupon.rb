class ProductSetCoupon < ApplicationRecord
  belongs_to :product_set
  belongs_to :coupon
end
