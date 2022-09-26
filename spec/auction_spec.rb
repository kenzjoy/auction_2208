require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

    it 'exists' do 
      expect(@auction).to be_an(Auction)
    end

    it 'has attributes' do
      expect(@auction.items).to eq([])
    end

  describe '#add_item' do
    it 'adds item objects to the item array' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.items).to eq([@item1, @item2])
    end
  end
end