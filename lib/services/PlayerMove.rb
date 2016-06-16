class PlayerMove
  attr_accessor :board, :team, :move

  def initialize(board,team)
    @board = board
    @team = team
  end

  def get_move
    puts "Please select a position 1-9."
    @move = (gets.chomp.to_i) - 1
  end

  def make_move
    @board.valid?(@move) ? change_board : invalid_move
  end

  def change_board
    @board.squares[move].value = @team
    puts "Updating Gameboard..."
    @board.current_board
    @board.remaining.delete(move)
  end

  def invalid_move
    puts "Your move is invalid."
    get_move
  end

  def run
    get_move
    make_move
  end
end