class UsersController < ApplicationController
  def edit
  end

  def update
  end

  private
  def user_params
    accessible = [ :name ]
    params.require(:user).permit(accessible)
  end
end
