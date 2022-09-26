class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    items << item
  end

  def item_names 
    items.map do |item|
      item.name
    end
  end

  def unpopular_items
    items.find_all do |item|
      item.bids.empty?
    end
  end

  def potential_revenue
    items.map do |item|
      item.current_high_bid
    end.compact.sum
  end

  def bidders
    items.map do |item|
      item.bids.map do |attendee, bid_amount|
        attendee.name
      end
    end.flatten.uniq
  end

  def bidder_info
    info_hash = {}
    bidder_list.each do |bidder|
      info_hash[bidder]
      require 'pry'; binding.pry
    end
  end

  def bidder_list
    items.map do |item|
      item.bids.map do |attendee, bid_amount|
        attendee
      end
    end.flatten.uniq
  end
end