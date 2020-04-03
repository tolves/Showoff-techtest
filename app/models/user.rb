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
    headers = {'Authorization' => authorization, 'Content-Type'=> 'application/json'}
    self.rest_client 'put', url, payload, headers
  end

  def self.changepasswd (current, new, authorization)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/password"
    payload = {
        'user' => {
            'current_password' => current,
            'new_password' => new
        }
    }
    headers = {'Authorization' => authorization, 'Content-Type'=> 'application/json'}
    self.rest_client 'post', url, payload, headers
  end

  def self.resetpasswd (email)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/reset_password"
    payload = {
        'user' => {'email' => email},
        'client_id' => '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe',
        'client_secret' => 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352'
    }
    headers = {'Content-Type'=> 'application/json'}
    self.rest_client 'post', url, payload, headers
  end

  def self.register (first_name, last_name, password, email, image_url)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users"
    payload = {
        'client_id' => '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe',
        'client_secret' => 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352',
        'user' => {
            'first_name' => first_name,
            'last_name' => last_name,
            'password' => password,
            'email' => email,
            'image_url' => image_url
        }
    }
    headers = {'Content-Type'=> 'application/json'}
    self.rest_client 'post', url, payload, headers
  end

  def self.widgets_index_me(authorization, term = '')
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/widgets?client_id=277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe&client_secret=d6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352" + term
    headers = {'Authorization' => authorization, 'Content-Type'=> 'application/json'}
    self.rest_client 'get', url, headers
  end
end
