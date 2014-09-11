class PagesController < ApplicationController
  def home
    @beer_of_the_moment = Drink.order("RANDOM()").first
    @bodyclass = "home"
  end
end
