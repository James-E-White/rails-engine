class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end
  def show
    if Item.exists?(params[:id])
     render json: ItemSerializer.new(Item.find(params[:id]))
    else
      render json: {error: "Item with this id does not exist"}, status: 404
    end
  end

    def create
    render json: ItemSerializer.new(Item.create!(item_params)), status: 201
  end

  def update
    item = Item.update(params[:id], item_params)
    if item.save
      render json: ItemSerializer.new(item)
    else
      render json: {error: "Item cannot be updated"}, status: 404
    end
  end

  def destroy
    render json: ItemSerializer.new(Item.destroy(params[:id]))
  end

private
    def item_params
      params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
    end
end