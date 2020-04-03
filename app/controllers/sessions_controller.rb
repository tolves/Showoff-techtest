class SessionsController < ApplicationController
  def new
  end

  def create
    session.clear
    if params[:login]
      oauth_create_token = Session.login(params[:login][:username], params[:login][:password])
      if oauth_create_token['message'] == 'Success'
        login_status = 'login success'
        session[:user_token] = oauth_create_token['data']['token']
        userinfo = Session.user_info(oauth_create_token['data']['token'])
        if userinfo['message'] == 'Success'
          session[:userinfo] = userinfo['data']
        end
      else
        login_status = 'login failed'
      end
      session[:login_status] = login_status
      redirect_to :widget_index
    end
  end

  def logout
    session.clear
    redirect_to :widget_index
  end

end
