class ProductAssign < ApplicationRecord
  belongs_to :product_set
  belongs_to :product_item
end
