require 'rails_helper'

RSpec.describe Merchant, type: :model do 
    describe 'validations' do 
       
    end

    describe 'relationships' do 
        it { should have_many :items }
    end
end