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

    # binding.pry
    expect(merchant[:attributes]).to have_key(:name)
    expect(merchant[:attributes][:name]).to be_a(String)
    expect(merchant[:attributes][:name]).to eq('Hegrids')
  end
end
