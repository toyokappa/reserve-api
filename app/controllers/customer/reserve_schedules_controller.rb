class Customer::ReserveSchedulesController < Customer::ApplicationController
  skip_before_action :authenticate_customer!

  def show
    start_date = Time.zone.parse(reserve_params[:start_date]).beginning_of_day
    end_date = start_date.since(13.days).end_of_day
    shifts = Shift.where(work_time: start_date..end_date)
    shifts = shifts.where(staff_id: reserve_params[:staff_id]) if reserve_params[:staff_id].present?
    schedule = ShiftTransformer.encode_for_reserve(shifts, reserve_params[:start_date])
    render json: { reserval_hours_first: Shift::RESERVAL_HOURS_FIRST, schedule: schedule }
  end

  private

  def reserve_params
    params.permit(:start_date)
  end
end
