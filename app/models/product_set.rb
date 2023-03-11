# == Schema Information
#
# Table name: product_sets
#
#  id                 :bigint           not null, primary key
#  description        :string(255)
#  has_purchase_limit :boolean
#  name               :string(255)
#  publish_state      :integer          default("published")
#  purchase_limit     :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class ProductSet < ApplicationRecord
  has_many :product_assigns, dependent: :destroy
  has_many :product_items, through: :product_assigns
  has_many :tickets, dependent: :nullify
  has_many :customer_group_product_sets, dependent: :destroy
  has_many :customer_groups, through: :customer_group_product_sets
  has_many :purchase_histories, dependent: :nullify
  has_many :product_set_coupons, dependent: :destroy
  has_many :coupons, through: :product_set_coupons

  enum :publish_state, { published: 1, unpublished: 2, limited: 3 }

  def total_amount
    product_assigns.sum(&:price)
  end

  def total_amount_only_main
    product_assigns.where(is_main: true).sum(&:price)
  end
end
