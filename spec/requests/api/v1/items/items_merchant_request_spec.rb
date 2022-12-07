require 'rails_helper'

RSpec.describe 'Item Merchant API' do
  it 'can get the items merchant' do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/#{item.id}/merchant"
    response_body = JSON.parse(response.body, symbolize_names: true)
    page = response_body[:data]

    expect(response).to be_successful
    expect(page).to have_key(:attributes)
    expect(page[:attributes]).to have_key(:name)
    expect(page[:attributes][:name]).to be_a(String)
  end

  it 'returns a 400 error when the item does not exist' do
    get '/api/v1/items/1/merchant'

    expect(response).to have_http_status(404)
  end
end
