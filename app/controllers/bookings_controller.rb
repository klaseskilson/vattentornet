class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :new]
  before_action :single_or_multi_create, only: :create
  authorize_resource

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  def multi_create
    # For each params.start_date to params.end_date
    # Put each date in params and call next line
    # Booking.create(params)
    # d = Date.new(params[:date])
    # d.wday, 0-6 where Sunday is zero
    # d += 7, or the amount of days you want to add
  end

  # POST /bookings
  # POST /bookings.json
  def create
    params = booking_params
    if params[:confirmed]
      params[:user_id] = current_user.id
    end
    @booking = Booking.new(params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    params = booking_params
    if params[:confirmed]
      params[:user_id] = current_user.id
    end
    respond_to do |format|
      if @booking.update(params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def single_or_multi_create
      if params[:interval]
        # Send to multi_create
        redirect_to :controller => 'bookings', :action => 'multi_create'
      else
        # Send to regular create
        redirect_to :controller => 'bookings', :action => 'create'
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:date, :description, :email, :pub, :confirmed, :user_id, :public, :interval, :end_date, :weekdays)
    end
end
