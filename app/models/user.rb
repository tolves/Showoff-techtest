class User < ApplicationRecord
  def self.user_update(first_name, last_name, date_of_birth, image_url, authorization)
    url = URL[:users][:update][:url]
    payload = {
        'user' => {
            'first_name' => first_name,
            'last_name' => last_name,
            'date_of_birth' => date_of_birth,
            'image_url' => image_url
        }
    }
    self.rest_client URL[:users][:update][:method], url, payload, self.auth_headers(authorization)
  end

  def self.changepasswd (current, new, authorization)
    url = URL[:users][:change_pwd][:url]
    payload = {
        'user' => {
            'current_password' => current,
            'new_password' => new
        }
    }
    self.rest_client URL[:users][:change_pwd][:method], url, payload, self.auth_headers(authorization)
  end

  def self.resetpasswd (email)
    url = URL[:users][:reset_pwd][:url]
    payload = {
        'user' => {'email' => email},
        'client_id' => CLIENT_ID,
        'client_secret' => CLIENT_SECRET
    }
    self.rest_client URL[:users][:reset_pwd][:method], url, payload, HEADERS
  end

  def self.register (first_name, last_name, password, email, image_url)
    url = URL[:users][:create][:url]
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
    self.rest_client URL[:users][:create][:method], url, payload, HEADERS
  end

  def self.widgets_index_me (authorization)
    url = URL[:users][:widgets][:index_me][:url] + "?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}"
    self.rest_client URL[:users][:widgets][:index_me][:method], url, self.auth_headers(authorization)
  end

  def self.search(term, authorization)
    url = URL[:users][:widgets][:index_me_term][:url] + "?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&term=#{term}"
    self.rest_client URL[:users][:widgets][:index_me_term][:method], url, self.auth_headers(authorization)
  end

  def self.check_email(email)
    url = URL[:users][:check_email][:url] + "?email=#{email}&client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}"
    self.rest_client URL[:users][:check_email][:method], url, HEADERS
  end
end
