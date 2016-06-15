class Computer
  attr_reader :name
  attr_accessor :score, :team, :current_game

  def initialize
    @name = "Computer"
    @score = 0
  end



  def computer_move(new_game)
    @current_game = new_game
    puts "The computer is thinking..."
    new_game.new_move(best_move,self.team,self)
  end

  def wins
    @score += 1
  end

  def best_move
    if best_available != nil
      to_win
    elsif block != nil
      to_block
    elsif @current_game.remaining.include?(5)
      5
    else
      @current_game.remaining.sample
    end
  end


  def best_available
    @current_game.winning_chain.find do |set| 
      (set -= current_positions).length == 1 && move_available?((set -= current_positions)[0]) 
    end
  end

  def block
    @current_game.winning_chain.find do |set|
      (set -= opposing_positions).length == 1 && move_available?((set -= current_positions)[0])
    end
  end

  def to_win
    if best_available != nil
      move = best_available - current_positions
      return move[0] + 1
    end
  end

  def to_block
    if block != nil
      move = block - opposing_positions
      return move[0] + 1
    end
  end

  def move_available?(move)
    move != nil ? @current_game.remaining.include?(move+1) : false
  end


  def opposing_positions
    opp_positions = []
    @current_game.squares.each_with_index do |sq,idx| 
      if sq.value != self.team && sq.value != "_" 
        opp_positions << idx
      end
    end
    opp_positions
  end

  def current_positions
    curr_positions = []
    @current_game.squares.each_with_index do |sq,idx| 
      curr_positions << idx if sq.value == self.team
    end
    curr_positions
  end

  def opp_on_corner?
  end
end



# check board to see if opponenet is setting up a fork
# fork means opponent occupies 2 c


