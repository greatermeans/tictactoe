require 'require_all'
require_all 'lib/*.rb'
require 'pry'
  
class Runner

  def initialize
    self.start
  end

  def start
    set_up_players
    how_many_rounds.times do |x|
      puts "Begin Round"
      game_run
    end
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

  def get_name
    puts "What is your name?"
    @human = gets.chomp
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

  def set_up_players
    @human = Person.create_or_find_by_name(get_name)
    @computer = Computer.new
    @human.choose_team
    @human.team == "X" ? @computer.team = "O" : @computer.team = "X"
  end
    
  def round
    @human.player_move(@new_game)
    if @new_game.who_won?(@human,@computer) == false && @new_game.remaining.count != 0
      @computer.computer_move(@new_game)
    end
  end
    

  def scoreboard
    puts "Your Score:#{@human.score}"
    puts "Computer Score:#{@computer.score}"
  end

  def reset_environment
    scoreboard
    @new_game.squares.each {|square| square.value = "_"}
    @new_game.remaining = (1..9).to_a
    return
  end

end

Pry.start