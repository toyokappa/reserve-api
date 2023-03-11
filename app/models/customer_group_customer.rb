# == Schema Information
#
# Table name: customer_group_customers
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  customer_group_id :bigint           not null
#  customer_id       :bigint           not null
#
# Indexes
#
#  index_customer_group_customers_on_customer_group_id  (customer_group_id)
#  index_customer_group_customers_on_customer_id        (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_group_id => customer_groups.id)
#  fk_rails_...  (customer_id => customers.id)
#
class CustomerGroupCustomer < ApplicationRecord
  belongs_to :customer_group
  belongs_to :customer
end
