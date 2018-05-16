require 'docking_station'

describe DockingStation do

	describe '#release_bike' do
			it 'raises an error when there are no bikes available' do
				expect { subject.release_bike }.to raise_error 'No bikes available'
			end
			it 'releases a bike' do
				bike = Bike.new
				subject.dock(bike)
				expect(subject.release_bike).to eq bike
			end
	end

	describe '#dock' do
		it 'raises an error when the dock is full' do
			20.times { subject.dock(Bike.new) }
			expect { subject.dock Bike.new }.to raise_error 'Docking station full'
		end

		it 'docks something' do
			bike = Bike.new
			expect(subject.dock(bike)).to eq bike
		end

		it 'returns docked bikes' do
			bike = Bike.new
			subject.dock(bike)
			expect(subject.bike).to eq bike
		end
	end

	it 'gets a bike and expects it to be working' do
		bike = Bike.new
		subject.dock(bike)
		expect(bike).to be_working
	end

end
