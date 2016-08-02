class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params["id"])
  end

  def destroy
    Item.find(params["id"]).destroy
    render :nothing => true, :status => 204
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item, status: 201
    else
      render 

  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end

end
