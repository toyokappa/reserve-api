class Customer::SchedulesController < Customer::ApplicationController
  def index
    @reservations = current_customer.reservations.where(scheduled_date: Time.current..).order(:scheduled_date)
  end
end