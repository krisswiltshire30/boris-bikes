require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def dock(bike)
    fail "Station at full capacity, can't dock bike" if @bikes
    @bikes << bike
  end

  def release_bike
    fail 'No bike available' unless @bikes
    @bikes
  end

end
