class ListsController < ApplicationController

  def index
    @lists = List.where(user_id: current_user.id).order(id: "DESC")
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      @list.get_site_info(@list.site_url)
      redirect_to lists_path
    else
      @lists = List.where(user_id: current_user.id).order(id: "DESC")
      @list = List.new
      render 'index'
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.get_site_info(@list.site_url)
    @list.update(list_params)
    redirect_to lists_path
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
