class ApplicationController < ActionController::Base
  def flash_notice(method, message)
    if message == 'Success'
      flash[:notice] = method + ' success'
    else
      flash[:notice] = method + ' failed: ' + message
    end
  end
end
