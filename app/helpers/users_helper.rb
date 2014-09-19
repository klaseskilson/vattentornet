module UsersHelper
  def user_admin?
    current_user.admin
  end

  def user_signed_in_and_admin?
    user_signed_in? && current_user.admin
  end
end
