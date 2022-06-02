class BookingsController < ApplicationController

  attr_accessor :end_date, :start_date

  def show
    @campervan = Campervan.find(params[:id])
    @bookings = Booking.all.select(params[:campervan_id])
  end

  def new
    @campervan = Campervan.find(params[:campervan_id])
    @user = current_user
    @booking = Booking.new # Needed to instantiate the form_for
  end

  def edit
    @campervan = Campervan.find(params[:id])
    @user = current_user
    @booking = Booking.find(params[:campervan_id])
  end

  def update
    @booking = Booking.find(params[:campervan_id])
    @booking = Booking.update(booking_params)
    redirect_to user_path(current_user)
  end

  def create
    @campervan = Campervan.find(params[:campervan_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.campervan = @campervan
    @booking.price_per_night = @campervan.price.to_i
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    # No need for app/views/bookings/destroy.html.erb
    redirect_to user_path(current_user), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
