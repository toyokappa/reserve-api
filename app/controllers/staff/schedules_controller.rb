class Staff::SchedulesController < Staff::ApplicationController
  def index
    # NOTE: 要件
    # 1. 次回のスケジュールが表示されていること
    # 2. 指定された期間のスケジュールが表示されていること
    @reservations = current_staff.reservations.eager_load(:program, :staff, :guest, :customer)
  end
end