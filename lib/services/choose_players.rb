class ChoosePlayers
  attr_accessor :player, :computer, :difficulty

  def initialize
    run
  end

  def welcome_message
    puts "Hello and welcome to TIC TAC and TOE."
  end

  def identify_player
    puts "Please enter your name!"
    @player = Person.create_or_find_by_name(gets.chomp)
  end

  def choose_difficulty
    puts "Please choose a difficulty on a scale of 1-3 (3=most diffcult)"
    @difficulty = gets.chomp.to_i
    choose_difficulty if !(1..3).include?(@difficulty)
  end

  def choose_team
    puts "Please choose a symbol for your team (Suggested: X or O)."    
    puts "You chose #{@player.team = gets.chomp}."
  end

  def set_up_ai
    @player.team == ("X" || "x") ? team = "O" : team = "X"
    @computer = Computer.new(@difficulty,team)
    puts "You are now playing against #{@computer.name}."
  end

  def run
    welcome_message
    identify_player
    choose_difficulty
    choose_team
    set_up_ai
  end
end


