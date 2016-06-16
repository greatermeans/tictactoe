class LevelThree
  attr_accessor :board, :team, :move

  def initialize(team)
    @team = team
  end

  def run(board)
    @board = board
    @board.squares[best_move].value = @team
    puts "Updating Gameboard..."
    @board.current_board
    binding.pry
    @board.remaining.delete(best_move)
  end

  def best_move
    if find_best_available != nil
      to_win
    elsif block != nil
      to_block
    elsif @board.remaining.include?(4)
      4
    else
      @board.remaining.sample
    end
  end

  def find_best_available
    @board.winning_chain.find do |set| 
      (set -= current_positions).length == 1 && move_available?((set -= current_positions)[0]) 
    end
  end

  def block
    @board.winning_chain.find do |set|
      (set -= opposing_positions).length == 1 && move_available?((set -= current_positions)[0])
    end
  end

  def to_win
    if find_best_available != nil
      @move = (find_best_available - current_positions)[0]
    end
  end

  def to_block
    if block != nil
      @move = (block - opposing_positions)[0]
    end
  end

  def move_available?(move)
    move != nil ? @board.remaining.include?(move) : false
  end


  def opposing_positions
    opp_positions = []
    @board.squares.each_with_index do |sq,idx| 
      if sq.value != @team && sq.value != " " 
        opp_positions << idx
      end
    end
    opp_positions
  end

  def current_positions
    curr_positions = []
    @board.squares.each_with_index do |sq,idx| 
      curr_positions << idx if sq.value == @team
    end
    curr_positions
  end
end