# == Schema Information
#
# Table name: purchase_histories
#
#  id               :bigint           not null, primary key
#  card_brand       :string(255)
#  card_expiration  :string(255)
#  card_number      :string(255)
#  card_owner       :string(255)
#  meta             :json
#  payjp_card_uid   :string(255)
#  payjp_charge_uid :string(255)
#  payment_method   :integer
#  product_set_name :string(255)
#  purchased_at     :datetime
#  total_amount     :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  coupon_id        :bigint
#  customer_id      :bigint
#  product_set_id   :bigint
#
# Indexes
#
#  index_purchase_histories_on_coupon_id       (coupon_id)
#  index_purchase_histories_on_customer_id     (customer_id)
#  index_purchase_histories_on_product_set_id  (product_set_id)
#
# Foreign Keys
#
#  fk_rails_...  (coupon_id => coupons.id)
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (product_set_id => product_sets.id)
#
class PurchaseHistory < ApplicationRecord
  has_many :purchase_details, dependent: :destroy
  belongs_to :product_set, optional: true
  belongs_to :customer, optional: true
  belongs_to :coupon, optional: true

  enum :payment_method, { card: 1, account_transfer: 2, cash: 3 }
end
