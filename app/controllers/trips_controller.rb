class TripsController < ApplicationController

  def index
    @trips = Trip.where(user_id: current_user.id).order(id: "DESC")
    @trip = Trip.new
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
    if @trip.save
      redirect_to trip_path(@trip.id)
    else
      @trips = Trip.where(user_id: current_user.id).order(id: "DESC")
      @trip = Trip.new
      render 'index'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.update(trip_params)
    redirect_to trip_path(trip.id)
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    redirect_to trips_path
  end

  def trips_search
    split_keyword = params[:keyword].split(/[[:blank:]]+/)
    @trips = []
    split_keyword.each do |keyword|
      next if keyword == ""
      @trips += Trip.where(["location like? OR comment like? ", "%#{keyword}%", "%#{keyword}%"])
    end
    @trips.uniq!
    @trip = Trip.new
    render 'index'
  end

  def calendar
    @trips = Trip.all
  end

  private

  def trip_params
    params.require(:trip).permit(:user_id, :location, :period, :comment, :starts_at, :ends_at)
  end

end
