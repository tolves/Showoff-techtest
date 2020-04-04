class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:login] && verify_recaptcha
      r = Session.login(params[:login][:username], params[:login][:password])
      if r['message'] == 'Success'
        login_status = 'login success'
        session[:user_token] = r['data']['token']
        session[:expires_at] = r['data']['token']['created_at'] + r['data']['token']['expires_in']
        session[:authorization] = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
        token = r['data']['token']['token_type'] + ' ' + r['data']['token']['access_token']
        userinfo = Session.show_me(token)
        if userinfo['message'] == 'Success'
          session[:userinfo] = userinfo['data']
        end
      else
        login_status = 'login failed' + r['message']
      end
      flash_notice('Login', r)
      session[:login_status] = login_status
    else
      flash[:notice] = 'Invalid captcha'
    end
    redirect_to :widget_index
  end

  def logout
    session.clear
    redirect_to :widget_index
  end

end
