class DrinksController < ApplicationController
  before_action :set_drink, except: [:index, :new, :create]
  before_action :set_api_info, only: [:show, :edit]
  before_action :authenticate_user!, except: [:show, :cookie]
  protect_from_forgery except: [:change_stock]

  # GET /sortiment/:id/dryck
  # GET /sortiment/:id/dryck.json
  def index
    @drinks = Drink.all
    @drink_types = DrinkType.all
  end

  # GET /sortiment/:id/dryck/1
  # GET /sortiment/:id/dryck/1.json
  def show
    @have_drank = cookies[@drink.slug]
  end

  # GET /sortiment/:id/dryck/new
  def new
    @drink = Drink.new
  end

  # GET /sortiment/:id/dryck/1/edit
  def edit
  end

  # POST /sortiment/:id/dryck
  # POST /sortiment/:id/dryck.json
  def create
    @drink = Drink.new(drink_params)

    respond_to do |format|
      if @drink.save
        format.html { redirect_to new_drink_path, notice: 'Drycken skapades.' }
        format.json { render :show, status: :created, location: @drink }
      else
        format.html { render :new }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sortiment/:id/dryck/1
  # PATCH/PUT /sortiment/:id/dryck/1.json
  def update
    respond_to do |format|
      if @drink.update(drink_params)
        format.html { redirect_to edit_drink_path(@drink), notice: 'Drycken uppdaterades.' }
        format.json { render :show, status: :ok, location: @drink }
      else
        format.html { render :edit }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sortiment/:id/dryck/1
  # DELETE /sortiment/:id/dryck/1.json
  def destroy
    @drink.destroy
    respond_to do |format|
      format.html { redirect_to drinks_url, notice: 'Drink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_stock
    @drink.instock = !@drink.instock
    respond_to do |format|
      if @drink.save!
        format.json { head :ok }
      else
        format.json { head :unprocessable_entity }
      end
    end
  end

  def cookie
    if cookies.permanent[@drink.slug]
      cookies.delete(@drink.slug)
    else
      cookies.permanent[@drink.slug] = 'yes'
    end
    redirect_to stock_drink_path(@drink.drink_type, @drink)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      @drink = Drink.friendly.find(params[:id])
    end

    # Fetch the information about the beer from brewery db
    def set_api_info
      @api_info = BREWERY.search.beers(q: "#{@drink.brewery} #{@drink.name}").first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_params
      params.require(:drink).permit(
        :name,
        :brewery,
        :country,
        :percentage,
        :price,
        :drink_type_id,
        :description,
        :instock,
        :label
      )
    end
end
