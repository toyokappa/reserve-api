class Admin::StaffsController < Admin::ApplicationController
  def index
    @trainers = Staff.all
  end

  def show
    @trainer = Staff.find(params[:id])
  end

  def update
    trainer = Staff.find(params[:id])
    trainer.update(trainer_params)
  end

  private

  def trainer_params
    params.require(:trainer).permit(
      :first_name,
      :last_name,
      :display_name,
      :image,
      :comment,
      :email,
      :frequency,
    )
  end
end