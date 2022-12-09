require 'rails_helper'

RSpec.describe 'Search Items API' do
  it 'can find by search all items like?' do
    item1 = create(:item, name: 'Calvin and Hobbes Comics', unit_price: 25)
    item2 = create(:item, name: 'Batman Comics', unit_price: 50)
    item3 = create(:item, name: 'Spider-man Comics', unit_price: 15)
    item4 = create(:item, name: 'Wolverine Comics', unit_price: 75)
    item5 = create(:item, name: 'Batman', unit_price: 5)
    item6 = create(:item, name: 'Archie comics', unit_price: 85)
    item7 = create(:item, name: 'Sleigh', unit_price: 12)
    get '/api/v1/items/find_all?name=Comics'

    response_body = JSON.parse(response.body, symbolize_names: true)
    items = response_body[:data]

    expect(items.count).to eq(5)

    items.each do |item|
      expect(item).to have_key(:attributes)
      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name].downcase.include?('comics')).to be(true)
      expect(item[:attributes][:name].downcase.include?('sleigh')).to be(false)
    end
  end

  it 'can find all items by searching price min' do
    item1 = create(:item, name: 'Calvin and Hobbes lego', unit_price: 100)
    item2 = create(:item, name: 'Batman lego', unit_price: 90)
    item3 = create(:item, name: 'Spider-man lego', unit_price: 15)
    item4 = create(:item, name: 'Wolverine lego', unit_price: 75)
    item5 = create(:item, name: 'Batman', unit_price: 5)
    item6 = create(:item, name: 'Archie lego', unit_price: 35)
    item7 = create(:item, name: 'Sleigh', unit_price: 12)
    
    get "/api/v1/items/find_all?min_price=5.00"
  
    response_body = JSON.parse(response.body, symbolize_names: true)
    items = response_body[:data]
  
    expect(response).to be_successful
    expect(items.count).to eq(7)

  end

    it 'can find all items by searching price max' do

    get "/api/v1/items/find_all?max_price=135.00"

    response_body = JSON.parse(response.body, symbolize_names: true)
    items = response_body[:data]
    expect(response).to be_successful
    expect(items.count).to eq(0)
  end
   
end
