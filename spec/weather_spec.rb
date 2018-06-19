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
      #weather = double(:weather)
      subject.stormy = true
      expect(subject.stormy?).to eq true
    end
  end

  # describe '#random_number' do
  #   it 'should set weather to not be stormy' do
  #     expect(subject.random_number).to eq false
  #   end
  # end

end
