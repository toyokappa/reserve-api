class Ticket < ApplicationRecord
  belongs_to :customer
  belongs_to :product_set, optional: true
  belongs_to :reservation, optional: true

  scope :usable, -> {
    tickets = where(reservation_id: nil, expiration: Time.current..)
  }

  scope :usable_ticket_set, -> {
    tickets = usable.order(expiration: :asc)
    set_count = tickets.group(:name, :expiration).count
    set_count.map.with_index(1) { |(k, v), i| { id: i, name: k[0], expiration: k[1], number_of_ticket: v } }
  }
end
