# == Schema Information
#
# Table name: guests
#
#  id         :bigint           not null, primary key
#  email      :string(255)
#  message    :string(255)
#  name       :string(255)
#  tel        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_guests_on_email  (email)
#  index_guests_on_tel    (tel)
#
class Guest < ApplicationRecord
  has_one :reservation, dependent: :destroy
end
