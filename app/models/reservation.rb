class Reservation < ApplicationRecord
  has_many :tickets, dependent: :nullify
  belongs_to :program
  belongs_to :staff
  belongs_to :customer, optional: true
  belongs_to :guest, optional: true

  def scheduled_time
    from = scheduled_date.to_fs(:time)
    to = (scheduled_date + required_time.minutes).to_fs(:time)
    "#{from}~#{to}"
  end
end
