require_relative 'bike'

class DockingStation

  attr_reader :bike

  def initialize
  end

  def dock(bike)
    fail "Station at full capacity, can't dock bike" if @bike
    @bike = bike
  end

  def release_bike
    fail 'No bike available' unless @bike
    @bike
  end

end
