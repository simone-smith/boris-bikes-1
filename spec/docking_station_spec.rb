require 'docking_station'
require 'Bike'

describe DockingStation do
	it 'responds to release_bike' do
		expect(subject).to respond_to :release_bike
	end

	it 'gets a bike and expects it to be working' do
		bike = subject.release_bike
		expect(bike).to be_working
	end
end
