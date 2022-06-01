class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @campervans = Campervan.all.select(params[:user_id])
    @bookings = Booking.all.select(params[:user_id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, status: :see_other
  end
end
