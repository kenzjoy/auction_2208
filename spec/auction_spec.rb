require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
  end

    it 'exists' do 
      expect(@auction).to be_an(Auction)
    end

    it 'has attributes' do
      expect(@auction.items).to eq([])
    end
end