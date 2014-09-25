class StaticPagesController < ApplicationController
  skip_authorization_check
  def home
    # beer of the moment
    @botm = Drink.order("RANDOM()").first
  end
end
