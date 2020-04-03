class WidgetController < ApplicationController
  def index
    widgets_index = Widget.get_widgets_index
    if widgets_index['message'] == 'Success'
      @widgets_index = widgets_index['data']
    end
    render :index
  end

  def create
    if params[:create]
      authorization = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
      r = Widget.create params[:create][:name], params[:create][:description], params[:create][:kind], authorization
      flash_notice('Create widget', r)
    end
    redirect_to :users_index_me
  end
end
