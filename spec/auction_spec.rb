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

  describe '#unpopular_items' do 
    it 'returns an array of item objects which have no bids' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)

      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])

      @item3.add_bid(@attendee2, 15)

      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end
  end

  describe '#potential_revenue' do
    it 'returns the potential revenue from an auction' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.potential_revenue).to eq(87)
    end
  end
end

# iteration 3
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

  describe '#bidders' do
    it 'returns an array of the names of each attendee that bid on the item' do 
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.bidders).to eq(['Megan', 'Bob', 'Mike'])
    end
  end

  describe '#bidder_info' do 
    it 'returns a hash with keys that are attendees, and values that
    are a hash with that attendees budgets and an array of items that
    attendee has bid on' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      @item1.close_bidding
      @item1.add_bid(@attendee3, 70)

      expected = {
        @attendee1 => {
                       :budget => 50,
                       :items => [@item1]
                      },
        @attendee2 => {
                       :budget => 75,
                       :items => [@item1, @item3]
                      },
        @attendee3 => {
                       :budget => 100,
                       :items => [@item4]
                      }
      }

      expect(@auction.bidder_info).to eq(expected)
    end
  end

  describe '#bidder_list' do 
    it 'creates an array of each bidder object to help bidder info method' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      @item1.close_bidding
      @item1.add_bid(@attendee3, 70)

      expect(@auction.bidder_list).to eq([@attendee1, @attendee2, @attendee3])
    end
  end
end