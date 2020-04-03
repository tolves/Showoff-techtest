module SessionsHelper
  def login(username, password)
    url = 'https://showoff-rails-react-production.herokuapp.com/oauth/token'
    payload = {'grant_type' => 'password',
               'client_id' => '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe',
               'client_secret' => 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352',
               'username' => username,
               'password' => password
    }
    begin
      oauth_create_token = RestClient.post url, payload, {content_type: :json}
    rescue RestClient::ExceptionWithResponse => e
      oauth_create_token = e.response
    end
    result = JSON.parse(oauth_create_token)
  end

  def user_info(token)
    url = 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/me'
    authorization = token['token_type'] + ' ' + token['access_token']
    begin
      api = RestClient.get url, {'Authorization' => authorization}
    rescue RestClient::ExceptionWithResponse => e
      api = e.response
    end
    result = JSON.parse(api)
  end
end
