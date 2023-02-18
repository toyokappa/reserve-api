class Customer::ProfilesController < Customer::ApplicationController
  def update
    current_customer.update!(profile_params)
    render json: { customer: current_customer }
  end

  private

  def profile_params
    params.require(:profile).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :tel,
      :postcode,
      :address,
      :image,
    )
  end
end