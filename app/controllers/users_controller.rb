class UsersController < ApplicationController
  private
  def user_params
    accessible = [ :name, :email ] # extend with your own params
    params.require(:user).permit(accessible)
  end
end
