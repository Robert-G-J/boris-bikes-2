class Bike

  attr_accessor :broken

  def initialize
    @broken = false
  end

  def working?
    true
  end

  def report_broken
    self.broken = true
  end

end
