class Staff::SchedulesController < Staff::ApplicationController
  def index
    from = Time.zone.parse(params[:start_date]).beginning_of_day
    to = from.since(6.days).end_of_day
    @next_reservation = current_staff.reservations.where(scheduled_date: from..).order(:scheduled_date).first
    reservations = current_staff.reservations.where(scheduled_date: from..to).order(:scheduled_date)
    @reservations = reservations.eager_load(:program, :staff, :guest, :customer)
  end
end