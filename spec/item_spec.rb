require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
  end

    it 'exists' do
      expect(@item1).to be_an(Item)
    end
end