# == Schema Information
#
# Table name: customer_groups
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CustomerGroup < ApplicationRecord
  has_many :customer_group_customers, dependent: :destroy
  has_many :customers, through: :customer_group_customers
  has_many :customer_group_product_sets, dependent: :destroy
  has_many :product_sets, through: :customer_group_product_sets
end
