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

# iteration 2
RSpec.describe Item do
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

  describe '#add_bid' do 
    it 'adds a bid to an item' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      expect(@item1.bids).to eq({})
    end
  end
end