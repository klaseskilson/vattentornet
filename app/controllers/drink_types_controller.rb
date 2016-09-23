class DrinkTypesController < ApplicationController
  before_action :set_drink_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  authorize_resource

  # GET /drink_types
  # GET /drink_types.json
  def index
    @drink_types = DrinkType.ordered_by_name.all
    @updated = Drink.order('updated_at').last.updated_at
    @drank = []
    @drink_types.each do |dt|
      dt.drinks.each do |d|
        @drank.push(d.slug) if cookies[d.slug]
      end
    end
  end

  # GET /drink_types/1
  # GET /drink_types/1.json
  def show
    @drinks = @drink_type.drinks.ordered_by_name
    @drank = []
    @drinks.each do |d|
      @drank.push(d.slug) if cookies[d.slug]
    end
  end

  # GET /drink_types/new
  def new
    @drink_type = DrinkType.new
  end

  # GET /drink_types/1/edit
  def edit
  end

  # POST /drink_types
  # POST /drink_types.json
  def create
    @drink_type = DrinkType.new(drink_type_params)

    respond_to do |format|
      if @drink_type.save
        format.html { redirect_to stock_path(@drink_type), notice: 'Drink type was successfully created.' }
        format.json { render :show, status: :created, location: @drink_type }
      else
        format.html { render :new }
        format.json { render json: @drink_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drink_types/1
  # PATCH/PUT /drink_types/1.json
  def update
    respond_to do |format|
      if @drink_type.update(drink_type_params)
        format.html { redirect_to stock_path(@drink_type), notice: 'Drink type was successfully updated.' }
        format.json { render :show, status: :ok, location: @drink_type }
      else
        format.html { render :edit }
        format.json { render json: @drink_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drink_types/1
  # DELETE /drink_types/1.json
  def destroy
    @drink_type.destroy
    respond_to do |format|
      format.html { redirect_to drink_types_url, notice: 'Drink type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_drink_type
    @drink_type = DrinkType.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def drink_type_params
    params.require(:drink_type).permit(:name, :description)
  end
end
