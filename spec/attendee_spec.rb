require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Attendee do
  before(:each) do
    @attendee = Attendee.new( {
                    name: 'Megan', 
                    budget: '$50'
                } )
  end

    it 'exists' do
      expect(@attendee).to be_an(Attendee)
    end
end