class CustomerGroupProductSet < ApplicationRecord
  belongs_to :customer_group
  belongs_to :product_set
end
