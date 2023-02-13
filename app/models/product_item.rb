class ProductItem < ApplicationRecord
  has_many :product_assigns, dependent: :destroy

  enum :category, { ticket: 1, other: 99 }
end
