class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user, not logged in
    if user.admin?
      can :manage, :all # Admins can do everything
    else
      can [:update, :read], Drink if user.persisted? # logged in user
      can :read, [Drink, DrinkType, Page, News]
      can [:read, :create, :month], Booking
      can :update, User, id: user.id # user can update itself
    end
  end
end
