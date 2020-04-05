class Widget < ApplicationRecord
  def self.visible_public
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?" +
        "client_id=" + CLIENT_ID +
        "&client_secret=" + CLIENT_SECRET
    self.rest_client 'get', url, HEADERS
  end

  def self.create(name, description, kind, authorization)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets"
    payload = {
        'widget' => {
            'name' => name,
            'description' => description,
            'kind' => kind
        }
    }
    self.rest_client 'post', url, payload, self.auth_headers(authorization)
  end

  def self.update(id, name, description, authorization)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/"+id
    payload = {
        'widget' => {
            'name' => name,
            'description' => description
        }
    }
    self.rest_client 'put', url, payload, self.auth_headers(authorization)
  end

  def self.delete(id, authorization)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/"+id
    self.rest_client 'delete', url, self.auth_headers(authorization)
  end

  def self.search(term)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?" +
        "client_id=" + CLIENT_ID +
        "&client_secret=" + CLIENT_SECRET +
        "&term=" + term
    self.rest_client 'get', url, HEADERS
  end
end
