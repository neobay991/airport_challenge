class Weather

  attr_accessor :stormy, :number

  def initialize
    @stormy = false
  end

  def stormy?
    @stormy
  end

  # def set_weather
  #   random_number
  # end

  def random_number
    number = rand(4)
    if number == 1
      @stormy = false
    else
      @stormy = true
    end
  end

end
