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
    self.rest_client 'put', url, payload, self.auth_headers(authorization)
  end

  def self.changepasswd (current, new, authorization)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/password"
    payload = {
        'user' => {
            'current_password' => current,
            'new_password' => new
        }
    }
    self.rest_client 'post', url, payload, self.auth_headers(authorization)
  end

  def self.resetpasswd (email)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/reset_password"
    payload = {
        'user' => {'email' => email},
        'client_id' => self.client_id,
        'client_secret' => self.client_secret
    }
    self.rest_client 'post', url, payload, HEADERS
  end

  def self.register (first_name, last_name, password, email, image_url)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users"
    payload = {
        'client_id' => CLIENT_ID,
        'client_secret' => CLIENT_SECRET,
        'user' => {
            'first_name' => first_name,
            'last_name' => last_name,
            'password' => password,
            'email' => email,
            'image_url' => image_url
        }
    }
    self.rest_client 'post', url, payload, HEADERS
  end

  def self.widgets_index_me (authorization)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/widgets?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}"
    self.rest_client 'get', url, self.auth_headers(authorization)
  end

  def self.search(term, authorization)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/widgets?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&term=#{term}"
    self.rest_client 'get', url, self.auth_headers(authorization)
  end

  def self.check_email(email)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/email?email=#{email}&client_id=#{self.client_id}&client_secret=#{self.client_secret}"
    self.rest_client 'get', url, HEADERS
  end
end
