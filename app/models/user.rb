class User < ApplicationRecord
  def self.user_update(first_name, last_name, date_of_birth, image_url, authorization)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/me"
    payload = {
        'user' => {
            'first_name' => first_name,
            'last_name' => last_name,
            'date_of_birth' => date_of_birth,
            'image_url' => image_url
        }
    }
    begin
      api = RestClient.put url, payload,{'Authorization' => authorization, 'Content-Type'=> 'application/json'}
    rescue RestClient::ExceptionWithResponse => e
      api = e.response
    end
    JSON.parse(api)
  end

  def self.changepasswd (current, new, authorization)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/password"
    payload = {
        'user' => {
            'current_password' => current,
            'new_password' => new
        }
    }
    begin
      api = RestClient.post url, payload,{'Authorization' => authorization, 'Content-Type'=> 'application/json'}
    rescue RestClient::ExceptionWithResponse => e
      api = e.response
    end
    JSON.parse(api)
  end

  def self.resetpasswd (email)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/reset_password"
    payload = {
        'user' => {'email' => email}, 'client_id' => '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe', 'client_secret' => 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352'
    }
    begin
      api = RestClient.post url, payload,{'Content-Type'=> 'application/json'}
    rescue RestClient::ExceptionWithResponse => e
      api = e.response
    end
    JSON.parse(api)
  end
end
