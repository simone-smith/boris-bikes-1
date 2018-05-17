require 'docking_station'

describe DockingStation do
	describe 'initialization' do
		subject { DockingStation.new } # why do we need this line?
		let(:bike) { Bike.new } # how is this different to typing Bike.new on lines 9 and 11?
	  it 'defaults capacity' do
	    described_class::DEFAULT_CAPACITY.times do
	      subject.dock(bike)
	    end
	    expect{ subject.dock(bike) }.to raise_error 'Docking station full'
	  end
	end

	describe '#dock' do
		it 'responds to bike' do
			expect(DockingStation.new).to respond_to(:bikes)
		end

		it 'docks something' do
			bike = Bike.new
			subject.dock(bike)
			expect(subject.bikes.last).to eq bike
		end

		it 'raises an error when the dock is full' do
			subject.capacity.times { subject.dock(Bike.new) }
			expect{ subject.dock Bike.new }.to raise_error 'Docking station full'
		end

		it 'has a default capacity' do
			expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
		end
	end

	describe '#release_bike' do
		it 'raises an error when there are no bikes available' do
			expect{ subject.release_bike }.to raise_error 'No bikes available'
		end

		it 'releases a bike when there is one available' do
			bike = Bike.new
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end
	end

	it 'gets a bike and expects it to be working' do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.release_bike).to be_working
	end

end
