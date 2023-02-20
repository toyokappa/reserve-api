class CustomerGroup < ApplicationRecord
  has_many :customer_group_customers, dependent: :destroy
  has_many :customers, through: :customer_group_customers
  has_many :customer_group_product_sets, dependent: :destroy
  has_many :product_sets, through: :customer_group_product_sets
end
