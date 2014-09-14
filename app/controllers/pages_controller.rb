class PagesController < ApplicationController
  skip_authorization_check
  def home
    @beer_of_the_moment = Drink.order("RANDOM()").first
    @bodyclass = "home"
  end
end
