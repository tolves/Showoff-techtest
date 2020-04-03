class UsersController < ApplicationController
  def update
    if params[:update_user]
      authorization = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
      r = User.user_update params[:update_user][:first_name], params[:update_user][:last_name], params[:update_user][:date_of_birth], params[:update_user][:image_url], authorization
      flash_notice('Updata User Information', r)
      if r['message'] == 'Success'
        session[:userinfo] =r['data']
      end
    end
    redirect_to :widget_index
  end

  def changepwd
    if params[:changepwd]
      authorization = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
      r = User.changepasswd params[:changepwd][:current_password],  params[:changepwd][:new_password], authorization
      flash_notice('Change password', r)
      if r['message'] == 'Success'
        #update new token into session
        session[:user_token] = r['data']['token']
      end
    end
    redirect_to :widget_index
  end

  def resetpwd
    if params[:resetpwd]
      r = User.resetpasswd params[:resetpwd][:email]
      flash_notice('Reset password', r , true)
    end
    redirect_to :widget_index
  end

  def register
    if params[:register]
      r = User.register params[:register][:first_name], params[:register][:last_name], params[:register][:password], params[:register][:email], params[:register][:image_url]
      flash_notice('Register', r)
    end
    redirect_to :widget_index
  end

  def index_me
    authorization = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
    @index_me = User.widgets_index_me authorization
    authorization = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
    @index_me_term = User.widgets_index_me authorization, '&term=visable'
  end
end
