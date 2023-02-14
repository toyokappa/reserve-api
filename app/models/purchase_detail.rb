class PurchaseDetail < ApplicationRecord
  belongs_to :purchase_history
  belongs_to :product_assign, optional: true
end
