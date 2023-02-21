class PurchaseDetail < ApplicationRecord
  belongs_to :purchase_history
  belongs_to :product_assign, optional: true
  belongs_to :coupon, optional: true
end
