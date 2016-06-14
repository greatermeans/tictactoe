require 'pry'

class Square
  attr_accessor :value


  @@all_squares = []
  # @@position = 0
  @@avail_squares = 0
  @@remaining = (1..9).to_a

  def initialize
    @value = "_"
    # @@position += 1
    @@avail_squares += 1
    @@all_squares << self
  end

  # def self.position
  #   @@position
  # end

  def self.remaining=(remaining)
    @@remaining = remaining
  end

  def self.remaining
    @@remaining
  end


  def self.all
    @@all_squares
  end
end




# keep track of its own position
# keeps track of its value