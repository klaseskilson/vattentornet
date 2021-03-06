class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :show

  # GET /news
  # GET /news.json
  def index
    @news = News.all.order('updated_at DESC')
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    params = news_params
    params[:user_id] = current_user.id
    @news = News.new(params)

    respond_to do |format|
      save_and_respond(format)
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to public_news_path(@news), notice: 'Nyheten uppdaterades.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_news
    @news = News.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def news_params
    params.require(:news).permit(:title, :body, :published, :user_id)
  end

  def save_and_respond(format)
    if @news.save
      format.html { redirect_to edit_news_path(@news), notice: 'Nyheten har skapats!' }
      format.json { render :show, status: :created, location: @news }
    else
      format.html { render :new }
      format.json { render json: @news.errors, status: :unprocessable_entity }
    end
  end
end
