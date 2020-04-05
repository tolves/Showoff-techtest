class UsersController < ApplicationController
  before_action  :session_expires, :except => [:resetpwd, :register, :check_email]
  before_action  :session_user_check, :except => [:resetpwd, :register, :check_email]
  protect_from_forgery :except => [:check_email]

  def index_me
    if params[:search]
      #search term
      @index_me = User.search session[:authorization], params[:search][:term]
      flash_notice('Search', @index_me)
    else
      @index_me = User.widgets_index_me session[:authorization]
    end
    render :index_me
  end

  def update
    if params[:update_user]
      r = User.user_update params[:update_user][:first_name], params[:update_user][:last_name], params[:update_user][:date_of_birth], params[:update_user][:image_url], session[:authorization]
      flash_notice('Updata User Information', r)
      if r['message'] == 'Success'
        session[:userinfo] =r['data']
      end
    end
    redirect_to :widget_index
  end

  def changepwd
    if params[:changepwd]
      r = User.changepasswd params[:changepwd][:current_password],  params[:changepwd][:new_password], session[:authorization]
      flash_notice('Change password', r)
      if r['message'] == 'Success'
        #update new token into session
        session[:user_token] = r['data']['token']
      end
    end
    redirect_to :widget_index
  end

  def resetpwd
    if params[:resetpwd] && verify_recaptcha
      r = User.resetpasswd params[:resetpwd][:email]
      puts r
      flash_notice('Reset password', r , true)
    else
      flash[:notice] = 'Invalid captcha'
    end
    redirect_to :widget_index
  end

  def register
    if params[:register] && verify_recaptcha
      r = User.register params[:register][:first_name], params[:register][:last_name], params[:register][:password], params[:register][:email], params[:register][:image_url]
      flash_notice('Register', r)
    else
      flash[:notice] = 'Invalid captcha'
    end
    redirect_to :widget_index
  end

  def check_email
    if params[:action] == "check_email" && params[:email]!=''
      r = User.check_email params[:email]
    else
      r = {'message'=>'false'}
    end
    render json: r
  end
end
