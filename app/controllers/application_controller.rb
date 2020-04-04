class ApplicationController < ActionController::Base
  def flash_notice(method, r, success = nil)
    if r['code'] == 0
      flash[:notice] = method + ' success'
      if success
        flash[:notice] = flash[:notice] + ': ' + r['message']
      end
    else
      flash[:notice] = method + ' failed: ' + r['message']
    end
  end
  def session_expires
    @time_left = session[:expires_at] - Time.now.to_i
    unless @time_left > 0
      reset_session
      flash[:notice] = 'Login information expired, please login again'
      redirect_to :widget_index
    end
  end
end
