class Customer::TicketsController < Customer::ApplicationController
  def index
    @tickets = current_customer.tickets.usable_ticket_set
  end
end