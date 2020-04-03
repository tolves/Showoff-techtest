class UsersController < ApplicationController
  def update
    if params[:update_user]
      authorization = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
      new_userinfo = User.user_update params[:update_user][:first_name], params[:update_user][:last_name], params[:update_user][:date_of_birth], params[:update_user][:image_url], authorization
      puts new_userinfo
      if new_userinfo['message'] == 'Success'
        session[:userinfo] =new_userinfo['data']
        flash[:notice] = 'updata user information success'
      else
        flash[:notice] = 'updata user information failed'
      end
    end
    redirect_to :widget_index
  end

  def changepwd
    if params[:changepwd]
      authorization = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
      changepwd_status = User.changepasswd params[:changepwd][:current_password],  params[:changepwd][:new_password], authorization
      if changepwd_status['message'] == 'Success'
        flash[:notice] = 'Change password success'
      else
        flash[:notice] = 'Change password failed'
      end
    end
    redirect_to :widget_index
  end

  def resetpwd
    if params[:resetpwd]
      @reset = User.resetpasswd params[:resetpwd][:email]
    end
    redirect_to :widget_index
  end
end
