class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    @list.get_site_info(@list.site_url)
    @list.save
    redirect_to list_path(@list.id)
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.get_site_info(@list.site_url)
    @list.update(list_params)
    redirect_to list_path(@list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:user_id, :spot_name, :address, :comment, :site_url, :latitude, :longitude)
  end

end
