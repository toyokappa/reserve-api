# == Schema Information
#
# Table name: payjp_customers
#
#  id          :bigint           not null, primary key
#  uid         :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint           not null
#
# Indexes
#
#  index_payjp_customers_on_customer_id  (customer_id)
#  index_payjp_customers_on_uid          (uid) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
class PayjpCustomer < ApplicationRecord
  belongs_to :customer
end
