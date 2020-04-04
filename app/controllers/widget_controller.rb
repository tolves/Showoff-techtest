class WidgetController < ApplicationController

  def index
    r = Widget.visible_public
    if r['message'] == 'Success'
      @widgets_view_public= r['data']
    end
    render :index
  end

  def create
    redirect_to :wigdet_index if (!session[:user_token] || !session[:userinfo])
    if params[:create]
      authorization = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
      r = Widget.create params[:create][:name], params[:create][:description], params[:create][:kind], authorization
      flash_notice('Create widget', r)
    end
    redirect_to :users_index_me
  end

  def update
    if params[:update]
      authorization = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
      r = Widget.update params[:update][:id], params[:update][:name], params[:update][:description], authorization
      flash_notice('Update widget', r)
    end
    redirect_to :users_index_me
  end

  def delete
    if params[:delete]
      authorization = session[:user_token]['token_type'] + ' ' + session[:user_token]['access_token']
      puts params[:delete][:id]
      r = Widget.delete params[:delete][:id], authorization
      flash_notice('Delete widget', r)
    end
    redirect_to :users_index_me
  end

  def search
    r = Widget.search params[:search][:term]
    if r['message'] == 'Success'
      @widgets_search= r['data']
    end
    render :index
  end
end
