# in lib/docking_sation.rb
require './lib/bike.rb'

class DockingStation
  attr_reader :bike

  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike = bike
  end
end
