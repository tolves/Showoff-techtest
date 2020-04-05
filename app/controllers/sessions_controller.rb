class SessionsController < ApplicationController
  def create
    if params[:login] && verify_recaptcha
      r = Session.login(params[:login][:username], params[:login][:password])
      if r['message'] == 'Success'
        session[:user_token] = r['data']['token']
        session[:expires_at] = r['data']['token']['created_at'] + r['data']['token']['expires_in']
        session[:authorization] = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
        userinfo = Session.show_me session[:authorization]
        if userinfo['message'] == 'Success'
          session[:userinfo] = userinfo['data']
        end
      end
      flash_notice('Login', r)
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
