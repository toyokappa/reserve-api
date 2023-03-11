# == Schema Information
#
# Table name: purchase_details
#
#  id                  :bigint           not null, primary key
#  amount              :integer
#  meta                :json
#  product_name        :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  coupon_id           :bigint
#  product_assign_id   :bigint
#  purchase_history_id :bigint           not null
#
# Indexes
#
#  index_purchase_details_on_coupon_id            (coupon_id)
#  index_purchase_details_on_product_assign_id    (product_assign_id)
#  index_purchase_details_on_purchase_history_id  (purchase_history_id)
#
# Foreign Keys
#
#  fk_rails_...  (coupon_id => coupons.id)
#  fk_rails_...  (product_assign_id => product_assigns.id)
#  fk_rails_...  (purchase_history_id => purchase_histories.id)
#
class PurchaseDetail < ApplicationRecord
  belongs_to :purchase_history
  belongs_to :product_assign, optional: true
  belongs_to :coupon, optional: true
end
