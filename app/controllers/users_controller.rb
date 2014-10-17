class UsersController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @users = User.all.order(admin: :desc, name: :asc)
  end

  def edit
  end

  def update
    @person = User.find(params[:id])
    if @person.update_attributes(user_params)
      sign_in @person, :bypass => true if current_user.id == @person.id
      redirect_to  users_path, :notice  => "Användare uppdaterad."
    else
      render :action => 'edit'
    end
  end

  def show
  end

  # def update
  # end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy

  #   if @user.destroy
  #       redirect_to root_url, notice: "User deleted."
  #   end
  # end

  def user_admin?
    self.admin
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :admin)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
