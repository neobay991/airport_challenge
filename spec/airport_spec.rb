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
      subject.land(plane, weather)
      expect(subject.planes.count).to eq 1
    end

    it 'should not be possible to land if weather is stormy' do
      plane = Plane.new
      weather = Weather.new
      weather.stormy = true
      expect{ subject.land(plane, weather) }.to raise_error "cannot land due to weather being stormy"
    end

    it 'should not be possible to land if airport is full' do
      plane = Plane.new
      weather = Weather.new
      expect{ 100.times{subject.land(plane, weather)} }.to raise_error "cannot land due to airport being full"
    end

  end

  describe '#take_off' do

    it 'should allow a plane to take-off' do
      plane = Plane.new
      weather = Weather.new
      subject.land(plane, weather)
      subject.take_off(weather)
      expect(subject.planes.count).to eq 0
    end

    it 'should confirm plane is no longer at the airport' do
      plane = Plane.new
      weather = Weather.new
      subject.land(plane, weather)
      subject.take_off(weather)
      expect(subject.take_off(weather)).to eq "Plane has left the airport"
    end

    it 'should not be possible to take-off if weather is stormy' do
      plane = Plane.new
      weather = Weather.new
      weather.stormy = true
      expect{ subject.take_off(weather) }.to raise_error "cannot take off due to weather being stormy"
    end

  end

  describe '#full?' do

    it 'should not be at full capacity by default' do
      expect(subject.full?).to eq false
    end

  end

end
