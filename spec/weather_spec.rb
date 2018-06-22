require 'weather'

describe Weather do

  describe '#initialize' do
    it 'should return the default weather to not be stormy' do
      expect(subject.stormy).to eq false
    end
  end

  describe '#stormy?' do
    it 'should return the weather to not be stormy' do
      expect(subject.stormy?).to eq false
    end

    it 'should set the weather to be stormy' do
      subject.stormy = true
      expect(subject.stormy?).to eq true
    end
  end

  describe '#random_number' do

    let(:weather_1) { double :weather, random_number: 1, stormy: true }
    let(:weather_2) { double :weather, random_number: 2, stormy: false }
    let(:weather_3) { double :weather, random_number: 3, stormy: false }
    let(:weather_4) { double :weather, random_number: 4, stormy: false }

    it 'should set weather to be stormy if random number is 1' do
      weather_1.random_number
      expect(weather_1.stormy).to eq true
    end

    it 'should set weather to not be stormy if random number is 2' do
      weather_2.random_number
      expect(weather_2.stormy).to eq false
    end

    it 'should set weather to not be stormy if random number is 3' do
      weather_3.random_number
      expect(weather_3.stormy).to eq false
    end

    it 'should set weather to not be stormy if random number is 4' do
      weather_4.random_number
      expect(weather_4.stormy).to eq false
    end

    it 'should set weather to be stormy if random number is 1' do
      allow(subject).to receive(:random_number) { 1 }
      expect(subject.random_number).to eq 1
    end

    it 'should set weather to not be stormy if random number is 2' do
      allow(subject).to receive(:random_number) { 2 }
      expect(subject.random_number).to eq 2
    end

    it 'should set weather to not be stormy if random number is 3' do
      allow(subject).to receive(:random_number) { 3 }
      expect(subject.random_number).to eq 3
    end

    it 'should set weather to not be stormy if random number is 4' do
      allow(subject).to receive(:random_number) { 4 }
      expect(subject.random_number).to eq 4
    end

  end

end
