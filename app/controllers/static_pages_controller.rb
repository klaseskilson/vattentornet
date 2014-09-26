class StaticPagesController < ApplicationController
  skip_authorization_check
  def home
    # beer of the moment
    @botm = Drink.order("RANDOM()").first
    @latest_post = News.where(:published => true).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
  end
end
