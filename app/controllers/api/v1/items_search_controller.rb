class Api::V1::ItemsSearchController < ApplicationController
  def index
    params[:name]
    items = Item.search_by_name(params[:name])
    render json: ItemSerializer.new(items)
  end

end
