require 'rails_helper'

RSpec.describe Item do
  describe 'attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:unit_price).is_greater_than(0) }
  end
  describe 'relationships' do
    it { should belong_to(:merchant) }
  end

  describe '#methods' do
    it 'finds items by search name' do
      item1 = create(:item, name: 'Calvin and Hobbes lego', unit_price: 25)
      item2 = create(:item, name: 'Batman lego', unit_price: 50)
      item3 = create(:item, name: 'Spider-man lego', unit_price: 15)
      item4 = create(:item, name: 'Wolverine lego', unit_price: 75)
      item5 = create(:item, name: 'Batman', unit_price: 5)
      item6 = create(:item, name: 'Archie lego', unit_price: 85)
      item7 = create(:item, name: 'Sleigh', unit_price: 12)

      array = Item.search_by_name('lego')
      expect(array.count).to eq(5)
    end

    it 'finds items by search min and max' do
      item1 = create(:item, name: 'Calvin and Hobbes lego', unit_price: 125)
      item2 = create(:item, name: 'Batman lego', unit_price: 500)
      item3 = create(:item, name: 'Spider-man lego', unit_price: 15)
      item4 = create(:item, name: 'Wolverine lego', unit_price: 75)
      item5 = create(:item, name: 'Batman', unit_price: 5)
      item6 = create(:item, name: 'Archie lego', unit_price: 835)
      item7 = create(:item, name: 'Sleigh', unit_price: 12)

      min = Item.search_by_price(75, 0)
      max = Item.search_by_price(0, 500)
      between = Item.search_by_price(100, 900)

      expect(min.count).to eq(4)
      expect(max.count).to eq(6)
      expect(between.count).to eq(3)


    end
  end
end
