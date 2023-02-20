class Coupon < ApplicationRecord
  has_many :customer_coupons, dependent: :destroy
  has_many :customers, through: :customer_coupons
  has_many :product_set_coupons, dependent: :destroy
  has_many :customers, through: :product_set_coupons
  has_many :purchase_histories, dependent: :destroy
end
