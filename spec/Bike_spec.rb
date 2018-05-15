require 'Bike'

describe Bike do
	
	it 'working?' do
		expect(Bike.new.working?).to eq true
	end

end