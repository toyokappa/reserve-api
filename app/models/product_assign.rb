# == Schema Information
#
# Table name: product_assigns
#
#  id                 :bigint           not null, primary key
#  days_of_expiration :integer
#  is_main            :boolean
#  number_of_item     :integer
#  price              :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  product_item_id    :bigint           not null
#  product_set_id     :bigint           not null
#
# Indexes
#
#  index_product_assigns_on_product_item_id  (product_item_id)
#  index_product_assigns_on_product_set_id   (product_set_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_item_id => product_items.id)
#  fk_rails_...  (product_set_id => product_sets.id)
#
class ProductAssign < ApplicationRecord
  has_many :purchase_details, dependent: :nullify
  belongs_to :product_set
  belongs_to :product_item
end
