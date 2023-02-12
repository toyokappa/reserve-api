class Customer::ReservesController < Customer::ApplicationController
  skip_before_action :authenticate_customer!

  def show
    # TODO: ログイン判定がクライアントに依存しているので時間がある時に修正案を考える
    logged_in = ActiveRecord::Type::Boolean.new.cast(reserve_params[:logged_in])
    if logged_in
      programs = Program.where(publish_target: 1)
    else
      programs = Program.where(publish_target: [2, 3])
    end
    render json: { program_list: programs }
  end

  private

  def reserve_params
    params.permit(:logged_in, :start_date)
  end
end
