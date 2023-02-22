# NOTE: Rails7で外部のURLを指定するとエラーとなるため一時的なパッチとして実装
# TODO: DeviseTokenAuthの大本が直ったらこのコントローラーは削除
class DeviseOverride::ConfirmationsController < DeviseTokenAuth::ConfirmationsController
  def show
    @resource = resource_class.confirm_by_token(resource_params[:confirmation_token])

    if @resource.errors.empty?
      yield @resource if block_given?

      redirect_header_options = { account_confirmation_success: true }

      if signed_in?(resource_name)
        token = signed_in_resource.create_token
        signed_in_resource.save!

        redirect_headers = build_redirect_headers(token.token,
                                                  token.client,
                                                  redirect_header_options)

        redirect_to_link = signed_in_resource.build_auth_url(redirect_url, redirect_headers)
      else
        redirect_to_link = DeviseTokenAuth::Url.generate(redirect_url, redirect_header_options)
      end

      redirect_to redirect_to_link, allow_other_host: true
    else
      redirect_to DeviseTokenAuth::Url.generate(redirect_url, account_confirmation_success: false), allow_other_host: true
    end
  end
end