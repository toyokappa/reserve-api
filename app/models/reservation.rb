# == Schema Information
#
# Table name: reservations
#
#  id            :bigint           not null, primary key
#  required_time :integer
#  scheduled_at  :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  customer_id   :bigint
#  guest_id      :bigint
#  program_id    :bigint           not null
#  staff_id      :bigint           not null
#
# Indexes
#
#  index_reservations_on_customer_id  (customer_id)
#  index_reservations_on_guest_id     (guest_id)
#  index_reservations_on_program_id   (program_id)
#  index_reservations_on_staff_id     (staff_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (guest_id => guests.id)
#  fk_rails_...  (program_id => programs.id)
#  fk_rails_...  (staff_id => staffs.id)
#
class Reservation < ApplicationRecord
  has_many :tickets, dependent: :nullify
  belongs_to :program
  belongs_to :staff
  belongs_to :customer, optional: true
  belongs_to :guest, optional: true

  validate :required_either_customer_or_guest
  validate :required_number_of_necessary_tickets

  def scheduled_datetime
    I18n.l(scheduled_at, format: :datetime_short)
  end

  def scheduled_date
    I18n.l(scheduled_at, format: :date_short)
  end

  def scheduled_time
    from = scheduled_at.to_fs(:time)
    to = (scheduled_at + required_time.minutes).to_fs(:time)
    "#{from}~#{to}"
  end

  private

  def required_either_customer_or_guest
    return if customer.present? ^ guest.present?

    errors.add(:base, '会員もしくはゲストのどちらか一方を入力してください')
  end

  def required_number_of_necessary_tickets
    required_ticket = program.required_ticket
    return if required_ticket == 0
    return if customer.blank?

    used_ticket = customer.tickets.usable.length
    return if required_ticket <= used_ticket
    
    errors.add(:base, 'お手持ちのチケットの枚数が不足しています')
  end
end
