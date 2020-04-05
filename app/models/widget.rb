class Widget < ApplicationRecord
  def self.visible_public
    url = URL[:widgets][:visible][:index][:url] +
        "?client_id=" + CLIENT_ID +
        "&client_secret=" + CLIENT_SECRET
    self.rest_client URL[:widgets][:visible][:index][:method], url, HEADERS
  end

  def self.create(name, description, kind, authorization)
    url = URL[:widgets][:create][:url]
    payload = {
        'widget' => {
            'name' => name,
            'description' => description,
            'kind' => kind
        }
    }
    self.rest_client URL[:widgets][:create][:method], url, payload, self.auth_headers(authorization)
  end

  def self.update(id, name, description, authorization)
    url = URL[:widgets][:update][:url] + "#{id}"
    payload = {
        'widget' => {
            'name' => name,
            'description' => description
        }
    }
    self.rest_client URL[:widgets][:update][:method], url, payload, self.auth_headers(authorization)
  end

  def self.delete(id, authorization)
    url = URL[:widgets][:delete][:url] + "#{id}"
    self.rest_client URL[:widgets][:delete][:method], url, self.auth_headers(authorization)
  end

  def self.search(term)
    url = URL[:widgets][:visible][:index_term][:url] +
        "?client_id=" + CLIENT_ID +
        "&client_secret=" + CLIENT_SECRET +
        "&term=" + term
    self.rest_client URL[:widgets][:visible][:index_term][:method], url, HEADERS
  end
end
