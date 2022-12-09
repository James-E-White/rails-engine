require 'rails_helper'

RSpec.describe 'Search Merchants API' do
  it 'can find a single merchant' do
    Merchant.create(name: 'Odowds', id: 1)
    Merchant.create(name: 'Zees', id: 2)
    Merchant.create(name: 'Hegrids', id: 3)
    Merchant.create(name: 'Hagrids', id: 4)
    get '/api/v1/merchants/find?name=Hegrids'

    response_body = JSON.parse(response.body, symbolize_names: true)
    merchant = response_body[:data]
    

    expect(merchant[:attributes]).to have_key(:name)
    expect(merchant[:attributes][:name]).to be_a(String)
    expect(merchant[:attributes][:name]).to eq('Hegrids')
  end

  it 'gives an error if no merchant is found' do
    Merchant.create(name: 'Odowds', id: 1)
    Merchant.create(name: 'Zees', id: 2)
    Merchant.create(name: 'Hegrids', id: 3)
    Merchant.create(name: 'Hagrids', id: 4)
    get '/api/v1/merchants/find?name=Dallas'

    expect(response).to_not be_successful
    expect(response).to have_http_status(404)
  end
end
