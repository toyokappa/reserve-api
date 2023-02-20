class PurchaseHistory < ApplicationRecord
  has_many :purchase_details, dependent: :destroy
  belongs_to :product_set, optional: true
  belongs_to :customer, optional: true
  belongs_to :coupon, optional: true

  enum :payment_method, { card: 1, account_transfer: 2, cash: 3 }
end
