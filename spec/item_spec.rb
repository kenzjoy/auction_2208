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

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)

      # add_bid adds to the bid hash where attendee 
      # is the key and the bid amount is the value
      expect(@item1.bids).to eq( {
                            @attendee2 => 20,
                            @attendee1 => 22
                            } )
    end
  end

  describe '#current_high_bid' do
    it 'returns the current high bid on an item' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)

      expect(@item1.current_high_bid).to eq(22)
    end
  end
end

# iteration 3
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

  describe '#close_bidding' do
    it 'updates the item so that it will not accept additional bids' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@item1.bids).to eq( {
                                  @attendee1 =>22,
                                  @attendee2 => 20
                                 } )

      @item1.close_bidding
      @item1.add_bid(@attendee3, 70)

      expect(@item1.bids).to eq( {
                                  @attendee1 =>22,
                                  @attendee2 => 20
                                 } )
    end
  end
end