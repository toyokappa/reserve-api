class Staff::ShiftsController < Staff::ApplicationController
  def show
    from = Time.zone.parse(params[:start_date]).beginning_of_day
    to = from.since(13.days).end_of_day
    shifts = current_staff.shifts.where(work_time: from..to)
    lock_days = current_staff.reservations.where(scheduled_at: from..to).pluck(:scheduled_at)
    schedule = ShiftTransformer.encode(shifts, lock_days, params[:start_date])
    render json: { reserval_hours_first: Shift::RESERVAL_HOURS_FIRST, schedule: schedule }
  end

  def update
    work_times = ShiftTransformer.decode_to_work_times(shift_params[:schedule])
    rest_times = ShiftTransformer.decode_to_rest_times(shift_params[:schedule])

    work_times_for_input = work_times.sort_by(&:to_datetime).map do |time|
      { work_time: Time.zone.parse(time) }
    end
    rest_times_for_input = rest_times.sort_by(&:to_datetime).map do |time|
      Time.zone.parse(time)
    end

    current_staff.shifts.upsert_all(work_times_for_input)
    current_staff.shifts.where(work_time: rest_times_for_input).destroy_all
  end

  private

  def shift_params
    params.require(:shift).permit(schedule: [:date, state_list: []])
  end
end
