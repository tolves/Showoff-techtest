class Widget < ApplicationRecord
  def self.visible_public
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?" +
        "client_id=" + self.client_id +
        "&client_secret=" + self.client_secret
    self.rest_client 'get', url, self.headers
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
    headers = self.headers.merge({'Authorization' => authorization})
    self.rest_client 'post', url, payload, headers
  end

  def self.update(id, name, description, authorization)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/"+id
    payload = {
        'widget' => {
            'name' => name,
            'description' => description
        }
    }
    headers = self.headers.merge({'Authorization' => authorization})
    self.rest_client 'put', url, payload, headers
  end

  def self.delete(id, authorization)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/"+id
    headers = self.headers.merge({'Authorization' => authorization})
    self.rest_client 'delete', url, headers
  end

  def self.search(term)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?" +
        "client_id=" + self.client_id +
        "&client_secret=" + self.client_secret +
        "&term=" + term
    self.rest_client 'get', url, self.headers
  end
end
