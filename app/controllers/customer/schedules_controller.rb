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
    Customer::ReserveMailer.with(
      to: current_customer.email,
      name: current_customer.full_name,
      program_name: @reservation.program.name,
      scheduled_date: I18n.l(@reservation.scheduled_date, format: :datetime_short),
      trainer_name: @reservation.staff.display_name,
    ).cancel.deliver_now
    Staff::ReserveMailer.with(
      to: @reservation.staff.email,
      name: @reservation.staff.full_name,
      program_name: @reservation.program.name,
      scheduled_date: I18n.l(@reservation.scheduled_date, format: :datetime_short),
      trainee_name: current_customer.full_name,
    ).cancel.deliver_now
  end
end