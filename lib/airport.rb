require_relative './plane.rb'
require_relative './weather.rb'

class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :planes, :plane_flying
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather)
    fail "cannot land due to stormy weather" if weather.stormy?
    fail "cannot land due to airport being full" if full?
    @planes << plane
  end

  def take_off(plane, weather)
    fail "cannot take-off due to stormy weather" if weather.stormy?
    fail 'cannot take-off plane, plane not at this airport' unless at_airport?(plane)
    @planes.pop
    # "Plane has left the airport"
  end

  def full?
    @planes.count >= @capacity
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end
end
