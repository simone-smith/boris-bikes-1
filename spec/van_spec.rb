require 'van'

describe Van do
  let(:docking_station) {double DockingStation.new}
  let(:bike1) {double :bike1}
  let(:bike2) {double :bike2}

  describe '#collect_broken_bikes' do
    it 'collects broken bikes from the docking station' do
      allow(bike1).to receive_messages(:working? => true)
      allow(bike2).to receive_messages(:working? => false)
      allow(docking_station).to receive_messages(:bikes => [bike1, bike2])
      subject.collect_broken_bikes(docking_station)
      expect(subject.collect_broken_bikes(docking_station).length).to eq 1
    end
  end
end


# allow(bike).to receive(:report_broken).and_return(@broken = true)
