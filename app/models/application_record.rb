class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  CLIENT_ID = '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe'
  CLIENT_SECRET = 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352'
  HEADERS = {'Content-Type'=> 'application/json'}

  def self.rest_client (method, url, payload = nil, headers, &block)
    begin
      r = RestClient::Request.execute(:method => method, :url => url, :payload => payload, :headers => headers, &block)
    rescue RestClient::ExceptionWithResponse => e
      r = e.response
    end
    JSON.parse(r)
  end

  def self.auth_headers(authorization)
    HEADERS.merge({'Authorization' => authorization})
  end
end
