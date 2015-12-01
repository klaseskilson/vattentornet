class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :confirm]
  before_action :user_confirmed, only: [:create, :update]
  before_action :authenticate_user!, except: [:index, :month, :new, :create]
  authorize_resource

  # GET /admin/bookings/all
  # GET /bookings.json
  def all
    @bookings = Booking.paginate(:page => params[:page], :per_page => 30).order('date DESC')
  end

  # GET /bookings
  # GET /bookings.json
  def index
    if current_user && current_user.admin
      @bookings_approved = Booking.where(:confirmed => true).where(['date > ?', DateTime.now - 7.days]).order('date ASC')
      @bookings_pending = Booking.where(:confirmed => false).order('date ASC')
    end
  end

  # GET /bookings/:year/:month.json
  def month
    month = Date.new(params[:year].to_i, params[:month].to_i).to_time
    @bookings = Booking.where(:date => month..month.end_of_month)
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    if current_user && current_user.admin
      @booking.public = true
      @booking.confirmed = true
    end
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    params = booking_params
    if params[:interval].to_i == 1
      params[:user_id] = current_user.id

      date = Date.parse(params[:date])
      end_date = Date.parse(params[:end_date])
      (date..end_date).to_a.each do |d|
        weekdays = params[:weekdays]
        params.delete [:weekdays, :end_date, :interval]
        if weekdays.include?(((d.wday + 6) % 7).to_s)
          p = params
          p[:date] = d
          Booking.create(p)
        end
      end
      respond_to do |format|
        format.html { redirect_to bookings_path, notice: 'Intervallbokningen har skapats.' }
        format.html { render json: { hurray: "yay" }, status: :created }
      end
    else
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
          format.html { redirect_to bookings_path, notice: 'Bokningen mottagen! Vi återkommer.' }
          format.json { render :show, status: :created, location: bookings_path }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def confirm
    @booking.confirmed = !@booking.confirmed
    @booking.user = current_user
    respond_to do |format|
      if @booking.save
        if @booking.confirmed && !@booking.public
          BookingMailer.booking_confirmed(@booking).deliver!
        end
        format.html { redirect_to bookings_path, notice: 'Bokningen har bekräftats!' }
      else
        format.html { redirect_to bookings_path, notice: 'Bokningen kunde inte bekräftas. Försök igen senare.' }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    params = booking_params
    respond_to do |format|
      if @booking.update(params)
        if @booking.confirmed && !@booking.public
          BookingMailer.booking_confirmed(@booking).deliver!
        end
        format.html { redirect_to @booking, notice: 'Bokningen har uppdaterats.' }
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
      format.html { redirect_to bookings_url, notice: 'Bokningen har tagits bort.' }
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
      params.require(:booking).permit(:date, :description, :email, :pub, :name, :apartment, :confirmed, :user_id, :public, :interval, :end_date, :weekdays=>[])
    end
end
