require_relative 'environment.rb'
  
class Runner

  def initialize
    self.start
  end

  def start
    set_up_players
    how_many_rounds.times do |x|
      puts "Begin New Round"
      game_run
      puts "This round is now over!"
    end
  end

  def set_up_players
    players = ChoosePlayers.new

    @human = players.player
    @computer = players.computer
  end

  def game_run
    @new_game = Board.new
    round until end_round == true
    return if tie == true
    @new_game.you_won(@new_game.who_won?(@human,@computer))
    reset_environment
  end

  def how_many_rounds
    puts "How many rounds would you like to play?"
    rounds = gets.chomp.to_i
  end

  def tie
    if @new_game.tie?(@human,@computer) == true
      puts "TIE!"
      reset_environment
      return true
    else
      nil
    end
  end

  def end_round
    @new_game.who_won?(@human,@computer) != false || @new_game.remaining.count == 0
  end

  def set_up_board
    @new_game = Board.new
  end
    
  def round
    PlayerMove.new(@new_game,@human.team).run
    if @new_game.who_won?(@human,@computer) == false && @new_game.remaining.count != 0
      @computer.level.run(@new_game)
    end
  end
    

  def scoreboard
    puts "Your Score:#{@human.score}"
    puts "Computer Score:#{@computer.score}"
  end

  def reset_environment
    scoreboard
    @new_game.squares.each {|square| square.value = " "}
    @new_game.remaining = (1..9).to_a
    return
  end

end

Pry.start