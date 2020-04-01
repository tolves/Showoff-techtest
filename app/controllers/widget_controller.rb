class WidgetController < ApplicationController
  def index
    client_id = '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe'
    client_secret = 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352'
    authorization = 'Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024'
    widgets_url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?" +
                  "client_id=" + client_id +
                  "&client_secret=" + client_secret
    begin
      widgets_index_api = RestClient.get widgets_url, {'Authorization' => authorization}
    rescue RestClient::ExceptionWithResponse => e
      widgets_index_api = e.response
    end
    widgets_index = JSON.parse(widgets_index_api)
    if widgets_index['message'] == 'Success'
      @widgets_index = widgets_index['data']
    end


    if !params[:oauth].nil?
      @oauth = params[:oauth].inspect
      oauth_url = 'https://showoff-rails-react-production.herokuapp.com/oauth/token'
      payload = { 'grant_type' => 'password',
                  'client_id' => '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe',
                  'client_secret' => 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352',
                  'username' => 'michael@showoff.ie',
                  #'password' => params[:oauth][:password],
                  'password' => 'password',
      }
      #422 error
      #@oauth_create = RestClient.post oauth_url, payload, {content_type: :json}
      #
      #
      #
      #
      url = URI("https://showoff-rails-react-production.herokuapp.com/oauth/token")

      https = Net::HTTP.new(url.host, url.port);
      https.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request["Content-Type"] = "application/json"
      request.body = "{\n    \"grant_type\": \"password\",\n    \"client_id\": \"77ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe\",\n    \"client_secret\": \"d6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352\",\n    \"username\": \"michael@showoff.ie\",\n    \"password\": \"password\"\n}"

      @response = https.request(request).inspect

    end



    render :index
  end

  def login

  end

end
