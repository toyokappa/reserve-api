class Coupon < ApplicationRecord
  has_many :customer_coupons, dependent: :destroy
  has_many :customers, through: :customer_coupons
  has_many :product_set_coupons, dependent: :destroy
  has_many :product_sets, through: :product_set_coupons
  has_many :purchase_histories, dependent: :nullify
  has_many :purchase_details, dependent: :nullify

  scope :usable, -> (customer) {
    used_coupon_count = customer.coupons.group(:id).count
    usable_ids = self.filter do |coupon|
      next true if coupon.use_limit.blank?
      next true unless used_coupon_count[coupon.id]

      used_coupon_count[coupon.id] < coupon.use_limit
    end.pluck(:id)
    where(id: usable_ids, expiration: Time.current..)
  }
end
