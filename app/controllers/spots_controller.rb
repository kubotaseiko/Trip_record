class SpotsController < ApplicationController

  def index
    @tag_list = Tag.all
    gon.spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    tag_list = params[:spot][:tag_name].split(/[[:blank:]]+/)
    @spot = @trip.spots.new(spot_params)
    @spot.user_id = current_user.id
    @spot.trip_id = @trip.id
    if @spot.save
      @spot.save_tag(tag_list)
      redirect_to trip_path(@trip.id)
    else
      render 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    @trip = @spot.trip
    @spot.user_id = current_user.id
    if @spot.update(spot_params)
      redirect_to trip_spot_path(@spot.id)
    else
      render 'edit'
    end
  end

  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to trip_path(params[:trip_id])
  end

  def tag_search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @spots = @tag.spots.all
  end

  private

  def spot_params
    params.require(:spot).permit(:user_id, :trip_id, :spot_name, :address, :comment, :latitude, :longitude, post_images_images: [])
  end

end
