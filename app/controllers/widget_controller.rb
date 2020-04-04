class WidgetController < ApplicationController
  before_action  :session_expires, :except => [:index, :search]

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
      r = Widget.create params[:create][:name], params[:create][:description], params[:create][:kind], session[:authorization]
      flash_notice('Create widget', r)
    end
    redirect_to :users_index_me
  end

  def update
    if params[:update]
      r = Widget.update params[:update][:id], params[:update][:name], params[:update][:description], session[:authorization]
      flash_notice('Update widget', r)
    end
    redirect_to :users_index_me
  end

  def delete
    if params[:delete]
      r = Widget.delete params[:delete][:id], session[:authorization]
      flash_notice('Delete widget', r)
    end
    redirect_to :users_index_me
  end

  def search
    r = Widget.search params[:search][:term]
    if r['message'] == 'Success'
      @widgets_search= r['data']
      flash_notice('Search', r)
    end
    render :index
  end
end
