require './lib/item'
require './lib/auction'
require './lib/attendee'

# iteration 1
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

  describe '#items_names' do
    it 'returns an array of the items name strings' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
  end
end

# iteration 2
RSpec.describe Auction do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new( {
                    name: 'Megan', 
                    budget: '$50'
                 } )
    @attendee2 = Attendee.new( {
                    name: 'Bob', 
                    budget: '$75'
                 } )
    @attendee3 = Attendee.new( {
                    name: 'Mike', 
                    budget: '$100'
                 } )
    @auction = Auction.new
  end

  
end