require 'rails_helper'

RSpec.describe Item do
  describe 'attributes' do
    xit { should validate_presence_of(:name) }
  end
    describe 'relationships' do 
    it { should belong_to(:merchant) }

  end
end