class SpotsController < ApplicationController

  def index
    @trip = Trip.find(params[:trip_id])
    @spots = @trip.spots.all
  end

  def show
    # @trip = Trip.find(params[:trip_id])
    # @spot = @trip.spots.find(params[:id])
    @spots = Trip.find(params[:id])
  end

  def new
    @spot = Spot.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    trip = Trip.find(params[:trip_id])
    # tag_list = params[:shop][:tag_name].split(/[[:blank:]]+/)
    spot = trip.spots.new(spot_params)
    spot.user_id = current_user.id
    spot.trip_id = trip.id
    if spot.save
      redirect_to trip_path(trip.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end

  private

  def spot_params
    params.require(:spot).permit(:user_id, :trip_id, :spot_name, :address, :comment, :latitude, :longitude, post_images_images: [])
  end

end
