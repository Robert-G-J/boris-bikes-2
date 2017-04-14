# in lib/docking_sation.rb
require './lib/bike.rb'

class DockingStation

  attr_reader :capacity
  attr_accessor :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'Error: no bikes available at this docking station.' if empty?
    fail 'Bike broken' if bikes[-1].broken
    bikes.pop
  end

  def dock(bike)
    fail 'Error: this docking station is occupied.' if full?
    bikes << bike
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end
