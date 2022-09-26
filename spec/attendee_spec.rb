require './lib/item'
require './lib/auction'
require './lib/attendee'

# iteration 1
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

    it 'has attributes' do 
      expect(@attendee.name).to eq('Megan')
      expect(@attendee.budget).to eq(50)
    end
end