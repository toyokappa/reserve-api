class Customer::ReservesController < Customer::ApplicationController
  skip_before_action :authenticate_customer!

  def show
    # TODO: ログイン判定がクライアントに依存しているので時間がある時に修正案を考える
    current_customer = Customer.find_by(id: params[:current_customer_id])
    if current_customer.present?
      @programs = Program.where(publish_target: 1).eager_load(:staffs)
      @number_of_ticket = current_customer.tickets.usable.length
    else
      @programs = Program.where(publish_target: [2, 3]).eager_load(:staffs)
    end
  end

  def create
    ActiveRecord::Base.transaction do
      reservation = Reservation.new(reservation_params)
      if customer_params.present?
        customer = Customer.find(customer_params[:id])
        reservation.customer = customer
      else
        guest = Guest.create!(guest_params)
        reservation.guest = guest
      end
      if reservation_params[:staff_id].blank?
        date = Time.zone.parse(reservation_params[:scheduled_at])
        exclude_dates = [date.ago(Program::INTREVAL_BEFORE), date, date.since(Program::INTREVAL_AFTER)]
        program = Program.find(reservation_params[:program_id])
        shift_staffs = program.staffs.joins(:shifts).where(shifts: { work_time: date })
        reserved_staffs = program.staffs.joins(:reservations).where(reservations: { scheduled_at: exclude_dates })
        staffs = shift_staffs - reserved_staffs
        staff_ids_with_frequency = staffs.map do |s|
          s.frequency.times.map { s.id }
        end.flatten
        reservation.staff_id = staff_ids_with_frequency.sample
      end
      reservation.save!
      if customer.present?
        tickets = customer.tickets.usable.order(:expiration).limit(customer_params[:required_ticket])
        tickets.update_all(reservation_id: reservation.id)
      end

      name = customer.present? ? customer.full_name : guest.name
      email = customer.present? ? customer.email : guest.email
      tel = customer.present? ? customer.tel : guest.tel
      customer_mailer = Customer::ReserveMailer.with(
        to: email,
        name: name,
        tel: guest&.tel,
        message: guest&.message,
        program_name: reservation.program.name,
        scheduled_date: reservation.scheduled_datetime,
        required_time: reservation.required_time,
        trainer_name: reservation.staff.display_name,
      )
      Staff::ReserveMailer.with(
        to: reservation.staff.email,
        name: reservation.staff.full_name,
        program_name: reservation.program.name,
        scheduled_date: reservation.scheduled_datetime,
        required_time: reservation.required_time,
        trainee_name: name,
        tel: tel,
      ).complete.deliver_now
      if customer.present?
        customer_mailer.complete_customer.deliver_now
      else
        customer_mailer.complete_guest.deliver_now
      end
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:program_id, :staff_id, :scheduled_at, :required_time)
  end

  def guest_params
    params.fetch(:guest, {}).permit(:name, :email, :tel, :message)
  end

  def customer_params
    params.fetch(:customer, {}).permit(:id, :required_ticket)
  end
end
