class Api::V1::ItemsSearchController < ApplicationController
  def index
    if
    params[:name]
    items = Item.search_by_name(params[:name])
    render json: ItemSerializer.new(items)
    else
      params[:min_price] || params[:max_price]
      items = Item.search_by_price(params[:min_price].to_i, params[:max_price].to_i)
      render json: ItemSerializer.new(items)
 
   end
 end 
end
 

