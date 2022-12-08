require 'rails_helper'

RSpec.describe 'Merchants API' do
  it 'lists all of the merchants' do
    create_list(:merchant, 11)

    get '/api/v1/merchants'

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    merchants = response_body[:data]

    expect(merchants.count).to eq(11)

    merchants.each do |merchant|
      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_an(String)

      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a(String)
    end
  end

  it 'can get one merchant by id' do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"
    
    expect(response).to be_successful
    
    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:data][:attributes]).to have_key(:name)
    expect(merchant[:data][:attributes][:name]).to be_a(String) 
  end

    it 'returns a 400 error when the merchant does not exist' do
    get "/api/v1/merchants/1"

    expect(response).to have_http_status(404)
  end

  #   it 'returns a error 404 message if no valid merchant id #' do
  #    create_list(:merchant, 11)
  #     get 'api/v1/merchants/8923987297'
  #     expect(response).to have_content('code, 404')
  #     expect(response).to have_content('status Not Found')
  #   end

  it 'it can get all items for a given merchant id' do
    merchant1 = create(:merchant)

    create_list(:item, 11, merchant_id: merchant1.id)

    get "/api/v1/merchants/#{merchant1.id}/items"

    response_body = JSON.parse(response.body, symbolize_names: true)
    items = response_body[:data]

    expect(response).to be_successful
    expect(merchant1.items.count).to eq(11)

    items.each do |item|
      expect(item).to have_key(:id)
      expect(item[:id]).to be_a(String)
      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name]).to be_a(String)
     # binding.pry
      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes][:description]).to be_a(String)
      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes][:unit_price]).to be_a(Float)
      expect(item[:attributes]).to have_key(:merchant_id)
      expect(item[:attributes][:merchant_id]).to be_a(Integer)
    end
  end
end
