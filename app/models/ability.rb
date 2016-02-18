class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user, not logged in

    if user.admin?
      can :manage, :all # Admins can do everything
    else
      if user.persisted?
        can [:update, :read], Drink
      end
      can :read, Drink
      can :read, DrinkType
      can [:read, :create, :month], Booking
      can :read, Page
      can :read, News
      can :update, User do |u|
        u.try(:user) == user
      end
    end
  end
end
