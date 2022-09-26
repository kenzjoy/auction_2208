require './lib/item'
require './lib/auction'
require './lib/attendee'

# iteration 1
RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

    it 'exists' do
      expect(@item1).to be_an(Item)
    end

    it 'has attributes' do 
      expect(@item1.name).to eq('Chalkware Piggy Bank')
    end
end