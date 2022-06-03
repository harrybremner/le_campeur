class CampervansController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @campervans = Campervan.all
    @markers = @campervans.geocoded.map do |campervan|
      {
        lat: campervan.latitude,
        lng: campervan.longitude,
        info_window: render_to_string(partial: "info_window", locals: { campervan: campervan })
      }
    end
    if params[:query].present?
      @campervans = Campervan.search_by_location(params[:query])
    else
      @campervans = Campervan.all
    end
  end

  def show
    @campervan = Campervan.find(params[:id])
    @campervans = Campervan.all
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
    params.require(:campervan).permit(:camper_type, :camper_make, :description, :total_occupancy,
                                      :total_beds, :region, :has_bathroom,
                                      :has_shower, :has_kitchen, :has_internet,
                                      :has_tv, :price, :address, :photo)
  end
end
