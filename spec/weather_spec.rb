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

end
