class Staff::KartesController < Staff::ApplicationController
  def index
    search_range = Time.current.ago(7.days)..Time.current
    @customers = Customer.includes(reservations: :program).where(reservations: { scheduled_at: search_range })
  end

  def create
    ActiveRecord::Base.transaction do
      if training_log_params[:photo].present?
        t_log = current_staff.training_logs.create!(training_log_params)
      end
      if body_metrics_log_params[:photo].present?
        b_log = current_staff.body_metrics_logs.create!(body_metrics_log_params)
      end
    end
  end

  def update
    # TODO: 後ほど実装
  end

  def destroy
    # TODO: 後ほど実装
  end

  private

  def training_log_params
    params.require(:training_log).permit(:photo, :customer_id, :reservation_id, :logged_at)
  end

  def body_metrics_log_params
    params.require(:body_metrics_log).permit(:photo, :customer_id, :reservation_id, :logged_at)
  end
end