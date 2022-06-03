class BookingsController < ApplicationController

  attr_accessor :end_date, :start_date

  def show
    @user = current_user
    @campervan = Campervan.find(params[:campervan_id])
    @booking = Booking.find(params[:id])
  end

  def new
    @campervan = Campervan.find(params[:campervan_id])
    @user = current_user
    @booking = Booking.new # Needed to instantiate the form_for
  end

  def edit
    @user = current_user
    @booking = Booking.find(params[:id])
    @campervan = @booking.campervan
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to user_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @campervan = Campervan.find(params[:campervan_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.campervan = @campervan
    @booking.price_per_night = @campervan.price.to_i
    if @booking.save
      redirect_to campervan_booking_path(id: @booking.id, campervan_id: @campervan.id)
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
