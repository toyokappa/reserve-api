# == Schema Information
#
# Table name: shifts
#
#  id         :bigint           not null, primary key
#  work_time  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  staff_id   :bigint           not null
#
# Indexes
#
#  index_shifts_on_staff_id                (staff_id)
#  index_shifts_on_staff_id_and_work_time  (staff_id,work_time) UNIQUE
#  index_shifts_on_work_time               (work_time)
#
# Foreign Keys
#
#  fk_rails_...  (staff_id => staffs.id)
#
class Shift < ApplicationRecord
  RESERVAL_HOURS_FIRST = 9  # 受付の最初の受付が9時
  RESERVAL_HOURS_LAST  = 21 # 受付の最後の受付が21時
  UNRESERVAL_HOURS_SINCE_NOW = 9 # 以降予約を受け付けない時間

  belongs_to :staff

  scope :with_unreserval, -> {
    unreserval_datetime = Time.current.since(UNRESERVAL_HOURS_SINCE_NOW.hours)
    where(work_time: [unreserval_datetime..])
  }
end
