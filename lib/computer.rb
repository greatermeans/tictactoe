class Computer
  attr_reader :name
  attr_accessor :score, :team, :moves

  def initialize
    @name = "Computer"
    @score = 0
    @moves = []
  end

  def computer_move
    move = Square.remaining.sample
    Board.new_move(move,self.team,self)
  end

  def wins
    @score += 1
  end

  def invalid_move
    puts "Your move is invalid."
    computer_move
  end


end

# makes moves
# score