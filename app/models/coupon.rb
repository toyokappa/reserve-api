# == Schema Information
#
# Table name: coupons
#
#  id              :bigint           not null, primary key
#  code            :string(255)
#  discount_amount :integer
#  expiration      :datetime
#  name            :string(255)
#  use_limit       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_coupons_on_code  (code) UNIQUE
#
class Coupon < ApplicationRecord
  has_many :customer_coupons, dependent: :destroy
  has_many :customers, through: :customer_coupons
  has_many :product_set_coupons, dependent: :destroy
  has_many :product_sets, through: :product_set_coupons
  has_many :purchase_histories, dependent: :nullify
  has_many :purchase_details, dependent: :nullify

  validates :code, presence: true, uniqueness: true

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
