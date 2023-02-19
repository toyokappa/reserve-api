class Reservation < ApplicationRecord
  has_many :tickets, dependent: :nullify
  belongs_to :program
  belongs_to :staff
  belongs_to :customer, optional: true
  belongs_to :guest, optional: true

  validate :required_either_customer_or_guest
  validate :required_number_of_necessary_tickets

  def scheduled_time
    from = scheduled_date.to_fs(:time)
    to = (scheduled_date + required_time.minutes).to_fs(:time)
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
    return if required_ticket < used_ticket
    
    errors.add(:base, 'お手持ちのチケットの枚数が不足しています')
  end
end
