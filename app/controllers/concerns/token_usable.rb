module TokenUsable
  extend ActiveSupport::Concern

  private
  def join_tokens
    return if response.headers['access-token'].nil?

    auth_json = {
      'access-token' => response.headers['access-token'],
      'client' => response.headers['client'],
      'uid' => response.headers['uid'],
    }
    response.headers.delete_if { |key| auth_json.include? key }
    access_token = CGI.escape(Base64.encode64(JSON.dump(auth_json)))

    json_body = JSON.parse(response.body)
    new_json_body = {
      'staff' => json_body['data'],
      'access_token' => access_token,
      'expiry' => response.headers['expiry'],
    }
    response.body = JSON.dump(new_json_body)
  end

  def split_tokens
    return if request.headers['Authorization'].blank?

    token = JSON.parse(Base64.decode64(CGI.unescape(request.headers['Authorization'].match(/Bearer /).post_match)))
    request.headers['access-token'] = token['access-token']
    request.headers['client'] = token['client']
    request.headers['uid'] = token['uid']
  end
end
