class Reservation < ApplicationRecord
  belongs_to :program
  belongs_to :staff
  belongs_to :customer, optional: true
  belongs_to :guest, optional: true
end
