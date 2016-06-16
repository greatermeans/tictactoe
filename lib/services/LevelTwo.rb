
class LevelTwo < LevelThree

  def best_move
    if find_best_available != nil
      to_win
    elsif @board.remaining.include?(4)
      4
    else
      @board.remaining.sample
    end
  end

end