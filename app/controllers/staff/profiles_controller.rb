class Staff::ProfilesController < Staff::ApplicationController
  def update
    current_staff.update(profile_params)
  end

  private

  def profile_params
    params.require(:profile).permit(
      :display_name,
      :image,
      :comment,
    )
  end
end