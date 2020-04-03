class Widget < ApplicationRecord
  def self.get_widgets_index
    client_id = '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe'
    client_secret = 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352'
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?" +
        "client_id=" + client_id +
        "&client_secret=" + client_secret
    headers = {'Content-Type'=> 'application/json'}
    self.rest_client 'get', url, headers
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
    headers = {'Authorization' => authorization, 'Content-Type'=> 'application/json'}
    puts payload
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
    headers = {'Authorization' => authorization, 'Content-Type'=> 'application/json'}
    self.rest_client 'put', url, payload, headers
  end

  def self.delete(id, authorization)
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/"+id
    headers = {'Authorization' => authorization, 'Content-Type'=> 'application/json'}
    self.rest_client 'delete', url, headers
  end
end
