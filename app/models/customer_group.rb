class CustomerGroup < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :product_set, optional: true
end
