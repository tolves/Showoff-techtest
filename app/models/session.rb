class Session < ApplicationRecord
  def self.login(username, password)
    url = 'https://showoff-rails-react-production.herokuapp.com/oauth/token'
    payload = {'grant_type' => 'password',
               'client_id' => self.client_id,
               'client_secret' => self.client_secret,
               'username' => username,
               'password' => password
    }
    self.rest_client 'post', url, payload, self.headers
  end

  def self.show_me(authorization)
    url = 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/me'
    headers = self.headers.merge({'Authorization' => authorization})
    self.rest_client 'get', url, headers
  end
end
