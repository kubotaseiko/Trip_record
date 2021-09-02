class FavoritesController < ApplicationController

  def create
    @spot = Spot.find(params[:spot_id])
    favorite = current_user.favorites.new(spot_id: set_spot.id)
    favorite.save
  end

  def destroy
    @spot = Spot.find(params[:spot_id])
    favorite = current_user.favorites.find_by(spot_id: set_spot.id)
    favorite.destroy
  end

  def favorite_all
    @favorites = Favorite.all
  end

end
