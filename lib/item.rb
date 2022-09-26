class Item
  attr_reader :name,
              :bids,
              :bidding_open

  def initialize(name)
    @name = name 
    @bids = {}
    @bidding_open = true
  end

  def add_bid(attendee, bid_amount)
    bids[attendee] = bid_amount
  end

  def current_high_bid
    bids.values.max_by do |bid|
      bid
    end
  end

  def close_bidding
    @bidding_open = false
  end
end