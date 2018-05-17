require_relative 'Bike'

class DockingStation
	attr_reader :bikes
	attr_accessor :capacity
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end

	def release_bike
		fail 'No bikes available' if empty?
		fail 'No working bikes available' if @bikes.last.broken?
		@bikes.pop
		# If all bikes are broken, say 'No bikes available'
		# if @bikes.all? {|bike| bike.broken?}
		# 	fail 'No bikes available'
		# Else, if there's a bike somewhere in the array that isn't broken, return it
		# else
		# 	working_bike = @bikes.index {|bike| bike.broken? == nil}
		# 	released_bike = @bikes.delete_at(working_bike)
		# end
	end

	def dock(bike)
		fail 'Docking station full' if full?
		@bikes << bike
	end

	private

	def full?
		@bikes.count >= @capacity
	end

	def empty?
    @bikes.empty?
	end
end
