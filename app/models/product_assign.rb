class ProductAssign < ApplicationRecord
  has_many :purchase_details, dependent: :nullify
  belongs_to :product_set
  belongs_to :product_item
end
