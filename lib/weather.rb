class Weather

  attr_accessor :stormy, :number

  def initialize
    @stormy = false
  end

  def stormy?
    @stormy
    # @stormy = random_number
  end

  def random_number
    number = rand(4)
    # if number = 1, than weather is stormy
    if number == 1
      @stormy = true
    else
      @stormy = false
    end
  end

end
