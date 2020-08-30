class WidgetController < ApplicationController
  before_action  :session_expires, :except => [:index, :search]
  before_action  :session_user_check, :except => [:index, :search]

  def index
    if params[:search]
      r = Widget.search params[:search][:term]
      flash_notice('Search', r)
    else
      r = Widget.visible_public
    end
      @widgets= r['data']['widgets']
    respond_to do |format|
      format.json { render json: @widgets }
      format.html { render :index }
    end
  end

  def create
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
end
