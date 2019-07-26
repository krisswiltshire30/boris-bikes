require_relative 'bike'

class DockingStation

  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    fail "Station at full capacity, can't dock bike" if full?
    @bikes << bike
  end



  def release_bike
    fail 'No bike available' if empty?
    @bikes.first
  end

  private

  def full?
   @bikes.length == @capacity
  end

  def empty?
    @bikes.empty?
  end

end
