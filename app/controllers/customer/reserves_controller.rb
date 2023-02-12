class Customer::ReservesController < Customer::ApplicationController
  skip_before_action :authenticate_customer!

  def show
    # TODO: ログイン判定がクライアントに依存しているので時間がある時に修正案を考える
    logged_in = ActiveRecord::Type::Boolean.new.cast(params[:logged_in])
    if logged_in
      @programs = Program.where(publish_target: 1).eager_load(:staffs)
    else
      @programs = Program.where(publish_target: [2, 3]).eager_load(:staffs)
    end
  end

  def create
    ActiveRecord::Base.transaction do
      guest = Guest.create!(guest_params)
      reservation = Reservation.new(reservation_params)
      reservation.guest = guest
      if reservation_params[:staff_id].blank?
        date = Time.zone.parse(reservation_params[:scheduled_date])
        exclude_dates = [date.ago(Program::INTREVAL_BEFORE), date, date.since(Program::INTREVAL_AFTER)]
        program = Program.find(reservation_params[:program_id])
        shift_staffs = program.staffs.joins(:shifts).where(shifts: { work_time: date })
        reserved_staffs = program.staffs.joins(:reservations).where(reservations: { scheduled_date: exclude_dates })
        staffs = shift_staffs - reserved_staffs
        reservation.staff = staffs.sample
      end
      reservation.save!
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:program_id, :staff_id, :scheduled_date, :required_time)
  end

  def guest_params
    params.require(:guest).permit(:name, :email, :tel, :message)
  end
end
