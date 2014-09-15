class StaticPagesController < ApplicationController
  skip_authorization_check
  def home
    @beer_of_the_moment = Drink.order("RANDOM()").first
  end

  def about
  end

  def contact
  end
end
