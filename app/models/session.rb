class Session < ApplicationRecord
  def self.login(username, password)
    url = 'https://showoff-rails-react-production.herokuapp.com/oauth/token'
    payload = {'grant_type' => 'password',
               'client_id' => CLIENT_ID,
               'client_secret' => CLIENT_SECRET,
               'username' => username,
               'password' => password
    }
    self.rest_client 'post', url, payload, HEADERS
  end

  def self.show_me (authorization)
    url = 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/me'
    self.rest_client 'get', url, self.auth_headers(authorization)
  end
end
