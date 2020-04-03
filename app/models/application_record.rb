class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.rest_client (method, url, payload = nil, headers, &block)
    begin
      r = RestClient::Request.execute(:method => method, :url => url, :payload => payload, :headers => headers, &block)
    rescue RestClient::ExceptionWithResponse => e
      r = e.response
    end
    JSON.parse(r)
  end

end
