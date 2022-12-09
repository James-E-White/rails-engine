require 'rails_helper'

RSpec.describe Item do
  describe 'attributes' do
    it { should validate_presence_of(:name) }
  end
    describe 'relationships' do 
    it { should belong_to(:merchant) }

  end

  describe '#methods' do 
    it 'finds items by search name' do
    item1 = create(:item, name: "Calvin and Hobbes lego", unit_price: 25)
    item2 = create(:item, name: "Batman lego", unit_price: 50)
    item3 = create(:item, name: "Spider-man lego", unit_price: 15)
    item4 = create(:item, name: "Wolverine lego", unit_price: 75)
    item5 = create(:item, name: "Batman", unit_price: 5)
    item6 = create(:item, name: "Archie lego", unit_price: 85)
    item7 = create(:item, name: "Sleigh", unit_price: 12)

    array = Item.search_by_name("lego")
    expect(array.count).to eq(5)
    end

    
  end
end