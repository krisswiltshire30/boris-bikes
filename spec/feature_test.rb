require '../lib/docking_station.rb'
require '../lib/bike.rb'

station = DockingStation.new
bike1 = Bike.new
bike2 = Bike.new

station.dock(bike1)
station.dock(bike2)
