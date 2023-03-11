# == Schema Information
#
# Table name: customer_coupons
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  coupon_id   :bigint           not null
#  customer_id :bigint           not null
#
# Indexes
#
#  index_customer_coupons_on_coupon_id    (coupon_id)
#  index_customer_coupons_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (coupon_id => coupons.id)
#  fk_rails_...  (customer_id => customers.id)
#
class CustomerCoupon < ApplicationRecord
  belongs_to :customer
  belongs_to :coupon
end
