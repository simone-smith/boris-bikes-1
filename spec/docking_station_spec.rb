require 'docking_station'

describe DockingStation do

	let(:bike) { double :bike }

	describe 'initialization' do
		subject { DockingStation.new } # why do we need this line?
	  it 'defaults capacity' do
	    described_class::DEFAULT_CAPACITY.times do
	      subject.dock(bike)
	    end
	    expect{ subject.dock(bike) }.to raise_error 'Docking station full'
	  end
	end

	describe '#dock' do
		it 'responds to bike' do
			expect(subject).to respond_to(:bikes)
		end

		it 'docks something' do
			subject.dock(bike)
			expect(subject.bikes.last).to eq bike
		end

		it 'raises an error when the dock is full' do
			subject.capacity.times { subject.dock bike }
			expect { subject.dock bike }.to raise_error 'Docking station full'
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
			# allow(bike).to receive(:broken?).and_return(@broken)
			bike = double(:bike, broken?: false)
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end
	end

	it 'gets a bike and expects it to be working' do
		# allow(bike).to receive(:working?).and_return(true)
		# allow(bike).to receive(:broken?).and_return(@broken)
		bike = double(:bike, broken?: @broken, working?: true)
		subject.dock(bike)
		expect(subject.release_bike).to be_working
	end

	it 'does not release a broken bike' do
		# allow(bike).to receive(:report_broken).and_return(@broken = true)
		# allow(bike).to receive(:broken?).and_return(@broken)
		bike = double(:bike, broken?: true, report_broken: @broken)
		bike.report_broken
		subject.dock(bike)
		expect{ subject.release_bike }.to raise_error 'No working bikes available'
	end

end
