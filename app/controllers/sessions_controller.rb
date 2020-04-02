class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session]
      oauth_url = 'https://showoff-rails-react-production.herokuapp.com/oauth/token'
      payload = {'grant_type' => 'password',
                 'client_id' => '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe',
                 'client_secret' => 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352',
                 'username' => params[:session][:username],
                 'password' => params[:session][:password]
      }
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
      session[:user] = @oauth_create_token
      redirect_to :widget_index
    end
  end

  privite
  def user_params
    params.require(:session).permit(:username, :password)
  end

end
