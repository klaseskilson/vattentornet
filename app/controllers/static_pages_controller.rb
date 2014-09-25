class StaticPagesController < ApplicationController
  skip_authorization_check
  def home
    @beer_of_the_moment = Drink.order("RANDOM()").first
    @latest_post = News.where(:published => true).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
  end

  def about
  end

  def contact
  end
end
