# == Schema Information
#
# Table name: product_items
#
#  id          :bigint           not null, primary key
#  category    :integer
#  description :string(255)
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ProductItem < ApplicationRecord
  has_many :product_assigns, dependent: :destroy

  enum :category, { ticket: 1, other: 99 }
end
