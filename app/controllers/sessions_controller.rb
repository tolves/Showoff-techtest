class SessionsController < ApplicationController
  def new
  end

  def create
    session.clear
    if params[:login]
      oauth_create_token = helpers.login(params[:login][:username], params[:login][:password])
      if oauth_create_token['message'] == 'Success'
        @oauth_create_token = oauth_create_token['data']
        userinfo = helpers.user_info(@oauth_create_token['token'])
        if userinfo['message'] == 'Success'
          session[:userinfo] = userinfo['data']
        end
      else
        @oauth_create_token = 'login failed'
      end
      session[:user] = @oauth_create_token
      redirect_to :widget_index
    end
  end

  def logout
    session.clear
    redirect_to :widget_index
  end



  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
