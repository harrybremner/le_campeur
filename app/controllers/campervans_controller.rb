class CampervansController < ApplicationController
  def index
    @campervans = Campervan.all
  end

  def show
    @campervan = Campervan.find(params[:id])
    @booking = Booking.new
  end

  def new
    @campervan = Campervan.new
  end

  def create
    @campervan = Campervan.new(campervan_params)
    @campervan.user = current_user
      if @campervan.save
        redirect_to campervans_path(@campervans)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
    @campervan = Campervan.find(params[:id])
  end

  def update
    @campervan = Campervan.find(params[:id])
    @campervan.update(campervan_params)
    redirect_to campervans_path(@campervans)
  end

  def destroy
    @campervan = Campervan.find(params[:id])
    @campervan.destroy
    redirect_to campervan_path, status: :see_other
  end

  private

  def campervan_params
    params.require(:campervan).permit(:camper_type, :camper_make, :total_occupancy,
                                      :total_beds, :region, :has_bathroom,
                                      :has_shower, :has_kitchen, :has_internet,
                                      :has_tv, :price, :address, :photo)
  end
end
