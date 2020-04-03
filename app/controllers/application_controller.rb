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
end
