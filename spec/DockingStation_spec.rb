require 'DockingStation'

describe DockingStation do
	
	it 'Did you really get a working bike?' do
		expect(DockingStation.new.release_bike).to eq true
	end

end