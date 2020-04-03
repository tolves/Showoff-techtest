class UsersController < ApplicationController
  def update
    if params[:update_user]
      authorization = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
      r = User.user_update params[:update_user][:first_name], params[:update_user][:last_name], params[:update_user][:date_of_birth], params[:update_user][:image_url], authorization
      if r['message'] == 'Success'
        session[:userinfo] =r['data']
        flash[:notice] = 'updata user information success'
      else
        flash[:notice] = 'updata user information failed:' + r['message']
      end
    end
    redirect_to :widget_index
  end

  def changepwd
    if params[:changepwd]
      authorization = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
      r = User.changepasswd params[:changepwd][:current_password],  params[:changepwd][:new_password], authorization
      if r['message'] == 'Success'
        flash[:notice] = 'Change password success'
      else
        flash[:notice] = 'Change password failed:' + r['message']
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

  def register
    if params[:register]
      r = User.register params[:register][:first_name], params[:register][:last_name], params[:register][:password], params[:register][:email], params[:register][:image_url]
      if r['message'] == 'Success'
        flash[:notice] = 'Register success'
      else
        flash[:notice] = 'Register failed: ' + r['message']
      end
    end
    redirect_to :widget_index
  end
end
