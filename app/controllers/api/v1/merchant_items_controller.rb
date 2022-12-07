class Api::V1::MerchantItemsController < ApplicationController
  def index
    merchant = Merchant.find(params[:merchant_id])
    render json: ItemSerializer.new(merchant.items)
  end
end


# def show 
#         # require 'pry';binding.pry
#         if Market.exists?(params[:id])
#             render json: MarketSerializer.new(market)
#         else 
#             render json: {"errors": "Market with this id doesn't exist"} , status: 404
#         end 
#     end