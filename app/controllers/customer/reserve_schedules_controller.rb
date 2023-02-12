class Customer::ReserveSchedulesController < Customer::ApplicationController
  skip_before_action :authenticate_customer!

  def show
    start_date = Time.zone.parse(params[:start_date]).beginning_of_day
    end_date = start_date.since(13.days).end_of_day
    program = Program.find(params[:program_id])
    staffs = program.staffs
    staffs = [Staff.find(params[:staff_id])] if params[:staff_id].present?
    shifts = []
    staffs.each do |staff|
      scheduled_dates = staff.reservations.pluck(:scheduled_date)
      exclude_dates = scheduled_dates.map do |date|
        [date.ago(Program::INTREVAL_BEFORE), date, date.since(Program::INTREVAL_AFTER)]
      end.flatten.uniq
      shifts += staff.shifts.where(work_time: start_date..end_date).where.not(work_time: exclude_dates)
    end
    schedule = ShiftTransformer.encode_for_reserve(shifts.uniq(&:work_time), params[:start_date])
    render json: { reserval_hours_first: Shift::RESERVAL_HOURS_FIRST, schedule: schedule }
  end
end
