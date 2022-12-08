class Api::V1::MerchantSearchController < ApplicationController
  def index
    #if
       merchant = Merchant.where('name ILIKE ?', "%#{params[:name]}%").first
       render json: MerchantSerializer.new(merchant)
     
    # else
    #   render json: { data: { error: 'Merchant not found' } }, status: 404
  
  end
end
