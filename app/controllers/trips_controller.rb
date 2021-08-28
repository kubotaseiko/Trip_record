class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @spots = @trip.spots.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    @trip.save
    redirect_to trip_path(@trip.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def tag_search
  end

  def search
  end

  private

  def trip_params
    params.require(:trip).permit(:user_id, :location, :period, :comment)
  end

end
