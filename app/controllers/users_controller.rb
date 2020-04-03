class UsersController < ApplicationController
  def update
    if params[:update_user]
      @r = helpers.user_update params[:update_user][:first_name], params[:update_user][:last_name], params[:update_user][:date_of_birth], params[:update_user][:image_url]
    end
    redirect_to :widget_index
  end

  def changepwd
    if params[:changepwd]
      @change = helpers.changepasswd params[:changepwd][:current_password],  params[:changepwd][:new_password]
    end
    redirect_to :widget_index
  end

  def resetpwd
    if params[:resetpwd]
      @reset = helpers.resetpasswd params[:resetpwd][:email]
    end
    redirect_to :widget_index
  end
end



private

def user_params
  params.require(:update_user).permit(:first_name, :last_name, :date_of_birth, :image_url)
  params.require(:changepwd).permit(:current_password, :new_password)
  params.require(:resetpwd).permit(:email)
end