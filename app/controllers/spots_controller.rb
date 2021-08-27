class SpotsController < ApplicationController
  
  def index
    @spots = Spot.all
  end
  
  def show
    @spot = Spot.find(params[:id])
  end
  
  def new
    @spot = Spot.new
  end
  
  def create
    @spot = current_user.spots.new(spot_params)
    @spot.save
    redirect_to spot_path(spot.id)
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
    params.require(:spot).permit(:user_id, :spot_name, :address, :comment, :latitude, :longitude)
  end
  
end
