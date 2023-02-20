class CustomerGroupCustomer < ApplicationRecord
  belongs_to :customer_group
  belongs_to :customer
end
