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
