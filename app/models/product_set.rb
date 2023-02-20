class ProductSet < ApplicationRecord
  has_many :product_assigns, dependent: :destroy
  has_many :product_items, through: :product_assigns
  has_many :tickets, dependent: :nullify
  has_many :customer_group_product_sets, dependent: :destroy
  has_many :customer_groups, through: :customer_group_product_sets
  has_many :purchase_histories, dependent: :nullify

  enum :publish_state, { published: 1, unpublished: 2, limited: 3 }

  def total_amount
    product_assigns.sum(&:price)
  end

  def total_amount_only_main
    product_assigns.where(is_main: true).sum(&:price)
  end
end
