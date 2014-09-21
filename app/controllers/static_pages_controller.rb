class StaticPagesController < ApplicationController
  skip_authorization_check
  def home
    @beer_of_the_moment = Drink.order("RANDOM()").first
    @latest_post = News.paginate(:page => params[:page], :per_page => 3)
  end

  def about
  end

  def contact
  end
end
