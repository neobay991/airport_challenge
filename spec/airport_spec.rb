require 'airport'
require 'plane'
require 'weather'

describe Airport do

  describe '#initialize' do

    it 'should create an empty planes array' do
      expect(subject.planes.count).to eq 0
    end

    it 'should set a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'should allow default capacity to be overridden' do
      subject.capacity = 50
      expect(subject.capacity).to eq 50
    end

  end

  describe '#land' do

    it 'should land a plane' do
      plane = Plane.new
      weather = Weather.new
      weather.stormy = false
      subject.land(plane, weather)
      expect(subject.planes.count).to eq 1
    end

    it 'should not be possible to land if weather is stormy' do
      plane = Plane.new
      weather = Weather.new
      weather.stormy = true
      message = "cannot land due to stormy weather"
      expect { subject.land(plane, weather) }.to raise_error message
    end

    it 'should not be possible to land if airport is full' do
      plane = Plane.new
      weather = Weather.new
      weather.stormy = false
      message = "cannot land due to airport being full"
      expect { 100.times { subject.land(plane, weather) } }.to raise_error message
    end

  end

  describe '#take_off' do

    it 'should allow a plane to take-off' do
      plane = Plane.new
      weather = Weather.new
      weather.stormy = false
      subject.land(plane, weather)
      subject.take_off(plane, weather)
      expect(subject.planes.length).to eq 0
    end

    # it 'should confirm plane is no longer at the airport' do
    #   plane = Plane.new
    #   weather = Weather.new
    #   weather.stormy = false
    #   subject.land(plane, weather)
    #   subject.take_off(plane, weather)
    #   message = "Plane has left the airport"
    #   expect(subject.take_off(plane, weather)).to eq message
    # end

    it 'should not be possible to take-off if weather is stormy' do
      plane = Plane.new
      weather = Weather.new
      weather.stormy = true
      message = "cannot take-off due to stormy weather"
      expect { subject.take_off(plane, weather) }.to raise_error message
    end

    it 'should not be possible to take-off if plane not at airport' do
      plane = Plane.new
      weather = Weather.new
      weather.stormy = false
      other_airport = Airport.new
      subject.land(plane, weather)
      message = "cannot take-off plane, plane not at this airport"
      expect { other_airport.take_off(plane, weather) }.to raise_error message
    end

  end

  describe '#full?' do

    it 'should not be at full capacity by default' do
      expect(subject.full?).to eq false
    end

  end

end
