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
      render json: item, status: 400
    end
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end

end
