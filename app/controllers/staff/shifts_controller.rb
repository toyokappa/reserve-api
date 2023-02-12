class Staff::ShiftsController < Staff::ApplicationController
  def show
    from = Time.zone.parse(params[:start_date]).beginning_of_day
    to = from.since(13.days).end_of_day
    shifts = current_staff.shifts.where(work_time: from..to)
    schedule = ShiftTransformer.encode(shifts, params[:start_date])
    render json: { reserval_hours_first: Shift::RESERVAL_HOURS_FIRST, schedule: schedule }
  end

  def update
    work_times = ShiftTransformer.decode_to_work_times(shift_params[:schedule])
    rest_times = ShiftTransformer.decode_to_rest_times(shift_params[:schedule])

    work_times_for_input = work_times.sort_by(&:to_datetime).map do |time|
      # 稼働時間を30分毎に分割
      Shift.input_times.times.map { |i| { work_time: Time.zone.parse(time) + (Shift::INPUT_INTERVAL * i) } }
    end.flatten
    rest_times_for_input = rest_times.sort_by(&:to_datetime).map do |time|
      # 休暇時間をを30分毎に分割
      Shift.input_times.times.map { |i| Time.zone.parse(time) + (Shift::INPUT_INTERVAL * i) }
    end.flatten

    current_staff.shifts.upsert_all(work_times_for_input)
    current_staff.shifts.where(work_time: rest_times_for_input).destroy_all
  end

  private

  def shift_params
    params.require(:shift).permit(schedule: [:date, state_list: []])
  end
end
