class Ticket < ApplicationRecord
  belongs_to :customer
  belongs_to :product_set, optional: true
  belongs_to :reservation, optional: true
end
