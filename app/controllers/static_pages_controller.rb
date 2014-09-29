class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
    # beer of the moment
    @botm = Drink.order("RANDOM()").first
    @latest_post = News.where(:published => true).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
  end

  def admin
    @in_stock = Drink.where(instock: true).count
    @new_users = User.where(confirmed_at: nil).count
    @latest_news = News.select('created_at').last
  end
end
