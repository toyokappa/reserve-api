class Customer::ReserveSchedulesController < Customer::ApplicationController
  skip_before_action :authenticate_customer!

  def show
    start_date = Time.zone.parse(params[:start_date]).beginning_of_day
    end_date = start_date.since(13.days).end_of_day
    program = Program.find(params[:program_id])
    staff_id = program.staff_ids
    staff_id = params[:staff_id] if params[:staff_id].present?
    shifts = Shift.where(work_time: start_date..end_date)
    shifts = shifts.where(staff_id: staff_id)
    schedule = ShiftTransformer.encode_for_reserve(shifts, params[:start_date])
    render json: { reserval_hours_first: Shift::RESERVAL_HOURS_FIRST, schedule: schedule }
  end
end
