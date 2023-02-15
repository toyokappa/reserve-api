class Customer::SchedulesController < Customer::ApplicationController
  def index
    @reservations = current_customer.reservations.where(scheduled_date: Time.current..).order(:scheduled_date)
  end

  def show
    @reservation = current_customer.reservations.find(params[:id])
  end

  def destroy
    @reservation = current_customer.reservations.find(params[:id])
    @reservation.destroy
  end
end