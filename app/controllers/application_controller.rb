class ApplicationController < ActionController::Base
  before_action :params_check, :excepts => [:logout, :check_email]

  def flash_notice(method, r, success = nil)
    if r['code'] == 0
      flash[:notice] = method + ' success'
      if success
        flash[:notice] = flash[:notice] + ': ' + r['message']
      end
    else
      flash[:notice] = method + ' failed: ' + r['message'].to_s
    end
  end

  def session_expires
    if !session[:expires_at]
      flash[:notice] = 'Login please'
      redirect_to :widget_index
      return
    end
    @time_left = session[:expires_at] - Time.now.to_i
    if @time_left < 0
      reset_session
      flash[:notice] = 'Login information expired, please login again'
      redirect_to :widget_index
    end
  end

  def session_user_check
    if (!session[:user_token] || !session[:userinfo])
      flash[:notice] = 'Error, login again please'
      redirect_to :widget_index
      return
    end
  end

  def params_check

    #login params check
    if params[:login]
      if params[:login][:username].nil? || params[:login][:password].nil?
        flash[:notice] = 'Username / Password can not be empty'
        redirect_to :widget_index
        return
      end
    end

    #search params check
    if params[:search]
      if params[:search][:term] == ''
        flash[:notice] = 'Keywords can not be empty'
        redirect_to :widget_index
        return
      end
    end

    #userinfo update params check
    if params[:update_user]
      if params[:update_user][:first_name] == '' || params[:update_user][:last_name] == ''
        flash[:notice] = 'Firstname or Lastname can not be blank'
        redirect_to :widget_index
        return
      end
    end

    #user change password params check.
    if params[:changepwd]
      if params[:changepwd][:current_password] == '' ||  params[:changepwd][:new_password] == ''
        flash[:notice] = 'Password can not be empty'
        redirect_to :widget_index
        return
      end
      if params[:changepwd][:new_password].length < 7
        flash[:notice] = 'Password length must be >7'
        redirect_to :widget_index
        return
      end
    end

    #user password reset check: email format and nil?
    if params[:resetpwd]
      if params[:resetpwd][:email] == ''
        flash[:notice] = 'Email address can not be empty'
        redirect_to :widget_index
        return
      end
      unless params[:resetpwd][:email] =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        flash[:notice] = "#{params[:resetpwd][:email]} is not an email"
        redirect_to :widget_index
        return
      end
    end

    #user register params check, name.nil? password length, email format
    if params[:register]
      if params[:register][:first_name] == '' || params[:register][:last_name] == '' || params[:register][:password] == '' || params[:register][:email] == ''
        flash[:notice] = 'Firstname, Lastname, Password can not be empty'
        redirect_to :widget_index
        return
      end
      if params[:register][:password].length < 7
        flash[:notice] = 'Password length must be >7'
        redirect_to :widget_index
        return
      end
      unless params[:register][:email] =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        flash[:notice] = "#{params[:register][:email]} is not an email"
        redirect_to :widget_index
        return
      end
    end

    #create widget: name.nil?
    if params[:create]
      if params[:create][:name] == ''
        flash[:notice] = 'Name can not be empty'
        redirect_to :users_index_me
        return
      end
    end

    #update widget: name.nil?
    if params[:update]
      if params[:update][:name] == ''
        flash[:notice] = 'Name can not be empty'
        redirect_to :users_index_me
        return
      end
    end

    if params[:delete]
      if params[:delete][:id].nil?
        flash[:notice] = 'ID can not be empty'
        redirect_to :users_index_me
        return
      end
    end
  end
end
