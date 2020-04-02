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
      oauth_url = 'https://showoff-rails-react-production.herokuapp.com/oauth/token'
      payload = {'grant_type' => 'password',
                 'client_id' => '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe',
                 'client_secret' => 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352',
                 'username' => params[:oauth][:username],
                 'password' => params[:oauth][:password]
      }
      #422 error
      begin
        oauth_create_token = RestClient.post oauth_url, payload, {content_type: :json}
      rescue RestClient::ExceptionWithResponse => e
        oauth_create_token = e.response
      end
      oauth_create_token = JSON.parse(oauth_create_token)
      if oauth_create_token['code'] == 0
        @oauth_create_token = oauth_create_token['data']
      else
        @oauth_create_token = 'login failed'
      end



    end

    render :index
  end

  def login

  end

end
