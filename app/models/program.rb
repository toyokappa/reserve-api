# == Schema Information
#
# Table name: programs
#
#  id              :bigint           not null, primary key
#  description     :string(255)
#  name            :string(255)
#  publish_target  :integer
#  required_ticket :integer
#  required_time   :integer
#  use_limit       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Program < ApplicationRecord
  INTREVAL_BEFORE = 60.minutes # TODO: 30分区切りで予約ができるようになったらここを変える
  INTREVAL_AFTER  = 60.minutes

  has_many :program_staffs, dependent: :destroy
  has_many :staffs, through: :program_staffs
  has_many :reservations, dependent: :destroy

  enum :publish_target, { only_customer: 1, only_guest: 2, all_users: 3, unpublishded: 4 }
end
