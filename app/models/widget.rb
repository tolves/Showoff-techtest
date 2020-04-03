class Widget < ApplicationRecord
  def self.get_widgets_index
    client_id = '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe'
    client_secret = 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352'
    authorization = 'Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024'
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?" +
        "client_id=" + client_id +
        "&client_secret=" + client_secret
    headers = {'Authorization' => authorization}
    self.rest_client 'get', url, headers
  end

  def self.create

  end

  def self.update

  end

  def self.destroy

  end

end
