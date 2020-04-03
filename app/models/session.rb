class Session < ApplicationRecord
  def self.login(username, password)
    url = 'https://showoff-rails-react-production.herokuapp.com/oauth/token'
    payload = {'grant_type' => 'password',
               'client_id' => '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe',
               'client_secret' => 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352',
               'username' => username,
               'password' => password
    }
    headers = {content_type: :json}
    self.rest_client 'post', url, payload, headers
  end

  def self.show_me(token)
    url = 'https://showoff-rails-react-production.herokuapp.com/api/v1/users/me'
    headers = {content_type: :json, 'authorization' => token}
    self.rest_client 'get', url, headers
  end
end
