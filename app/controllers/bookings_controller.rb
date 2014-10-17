class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :user_confirmed, only: [:create, :update]
  before_action :authenticate_user!, except: [:index, :new, :create]
  authorize_resource

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
    @bookings_approved = Booking.where(:confirmed => true)
    @bookings_pending = Booking.where(:confirmed => false)
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

  # POST /bookings
  # POST /bookings.json
  def create
    params = booking_params
    # if params[:interval]
    #   date = Date.parse(params[:date])
    #   end_date = Date.parse(params[:end_date])
    #   (date..end_date).to_a.each do |d|
    #     Rails.logger.info "dag: #{d}"
    #     if params[:weekdays].include?((d.wday + 6) % 7)
    #       p = params
    #       p[:date] = d
    #       Rails.logger.info "Dagens params: #{p}"
    #       Booking.create(p)
    #       # if !@booking.save
    #       #   respond_to do |format|
    #       #     format.html { redirect_to bookings_path, notice: "Bookings where not created......." }
    #       #     format.html { render json: { hurray: "noooo" }, status: :created }
    #       #   end
    #       # end
    #     end
    #   end
    #   respond_to do |format|
    #     format.html { redirect_to bookings_path, notice: "Bookings where succesfully created" }
    #     format.html { render json: { hurray: "yay" }, status: :created }
    #   end
    # else
      if current_user
        params[:user_id] = current_user.id
      else
        params[:confirmed] = false
      end
      @booking = Booking.new(params)

      respond_to do |format|
        if @booking.save
          # send mail
          BookingMailer.booking_received_booker(@booking).deliver!
          BookingMailer.booking_received_board(@booking).deliver!
          format.html { redirect_to bookings_path, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: bookings_path }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    # end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    params = booking_params
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
    def user_confirmed
      if params[:confirmed]
        params[:user_id] = current_user.id
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:date, :description, :email, :pub, :confirmed, :user_id, :public, :interval, :end_date, :weekdays=>[])
    end
end
