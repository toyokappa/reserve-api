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
