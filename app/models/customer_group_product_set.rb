# == Schema Information
#
# Table name: customer_group_product_sets
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  customer_group_id :bigint           not null
#  product_set_id    :bigint           not null
#
# Indexes
#
#  index_customer_group_product_sets_on_customer_group_id  (customer_group_id)
#  index_customer_group_product_sets_on_product_set_id     (product_set_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_group_id => customer_groups.id)
#  fk_rails_...  (product_set_id => product_sets.id)
#
class CustomerGroupProductSet < ApplicationRecord
  belongs_to :customer_group
  belongs_to :product_set
end
