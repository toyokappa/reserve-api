class Staff::SchedulesController < Staff::ApplicationController
  def index
    from = Time.zone.parse(params[:start_date]).beginning_of_day
    to = from.since(6.days).end_of_day
    reservations = current_staff.reservations.where(scheduled_date: from..to)
    @reservations = reservations.eager_load(:program, :staff, :guest, :customer)
  end
end