class Session < ApplicationRecord
  def self.login(username, password)
    url = URL[:authentication][:create][:url]
    payload = {'grant_type' => 'password',
               'client_id' => CLIENT_ID,
               'client_secret' => CLIENT_SECRET,
               'username' => username,
               'password' => password
    }
    self.rest_client URL[:authentication][:create][:method], url, payload, HEADERS
  end

  def self.show_me (authorization)
    url = URL[:users][:show_me][:url]
    self.rest_client URL[:users][:show_me][:method], url, self.auth_headers(authorization)
  end
end
