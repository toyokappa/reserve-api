# == Schema Information
#
# Table name: product_set_coupons
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  coupon_id      :bigint           not null
#  product_set_id :bigint           not null
#
# Indexes
#
#  index_product_set_coupons_on_coupon_id       (coupon_id)
#  index_product_set_coupons_on_product_set_id  (product_set_id)
#
# Foreign Keys
#
#  fk_rails_...  (coupon_id => coupons.id)
#  fk_rails_...  (product_set_id => product_sets.id)
#
class ProductSetCoupon < ApplicationRecord
  belongs_to :product_set
  belongs_to :coupon
end
