require './lib/docking_station'

p station = DockingStation.new
p bike = Bike.new
p bike.report_broken
p station.dock bike
p station.release_bike
  #fail the release when the bike is broken
