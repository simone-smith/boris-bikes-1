require_relative 'docking_station'
require_relative 'Bike'

class Van
  def collect_broken_bikes(docking_station)
    collected = []
    docking_station.bikes.each do |bike|
      if !bike.working?
        collected << bike
        docking_station.bikes.delete[bike]
      end
    end
    collected
  end
end
