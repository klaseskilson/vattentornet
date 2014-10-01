class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user, not logged in

    if user.admin?
      can :manage, :all # Admins can do everything
    else
      can :read, Drink
      can :read, DrinkType
      can [:read, :create], Booking
      can :read, Page
      can :read, News
      can :update, User do |user|
        user.try(:user) == user
      end
    end
  end
end
