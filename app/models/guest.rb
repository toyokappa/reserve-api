class Guest < ApplicationRecord
  has_one :reservation, dependent: :destroy
end
