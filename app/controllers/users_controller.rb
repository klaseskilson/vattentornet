class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to root_url, notice: "User deleted."
    end
  end

  def user_admin?
    self.admin
  end

  private
  def user_params
    accessible = [ :name, :email ] # extend with your own params
    params.require(:user).permit(accessible)
  end

end
