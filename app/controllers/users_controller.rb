class UsersController < ApplicationController

  def show
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end

  private
  def user_params
    accessible = [ :name, :email ] # extend with your own params
    params.require(:user).permit(accessible)
  end
end
