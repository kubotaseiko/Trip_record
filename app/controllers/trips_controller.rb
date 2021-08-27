class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end
  
  def show
    @trip = Trip.find(params[:id])
  end
  
  def new
    @trip = Trip.new
  end
  
  def create
    @Trip = current_user.trips.new(trip_params)
    @trip.save
    redirect_to trip_path(trip.id)
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
  
  def spot_params
    params.require(:trip).permit(:user_id, :location, :period, :comment)
  end

end
