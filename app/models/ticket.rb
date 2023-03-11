# == Schema Information
#
# Table name: tickets
#
#  id             :bigint           not null, primary key
#  expiration     :datetime
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  customer_id    :bigint           not null
#  product_set_id :bigint
#  reservation_id :bigint
#
# Indexes
#
#  index_tickets_on_customer_id     (customer_id)
#  index_tickets_on_product_set_id  (product_set_id)
#  index_tickets_on_reservation_id  (reservation_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (product_set_id => product_sets.id)
#  fk_rails_...  (reservation_id => reservations.id)
#
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
