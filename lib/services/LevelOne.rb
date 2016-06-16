class LevelOne < LevelThree
  attr_accessor :board, :team, :move

  def best_move
      @board.remaining.sample
  end

end