class Person
  attr_accessor :name, :score, :moves, :team

  @@all_players = []

  # def self.new_player
    
  # end

  def initialize(name)
    @name = name
    @moves = []
    @score = 0
    @team = nil
    @@all_players << self
    puts "Hello, #{name}! Welcome to TIC TAC TOEEEEE!"
    # choose_team
  end

  def choose_team
    puts "Please choose a team (Suggested: X or O)."
    @team = gets.chomp
    puts "You chose #{@team}. You are playing against Computer."
  end

  def player_move
    puts "Please select a position 1-9."
    move = gets.chomp.to_i
    Board.new_move(move,@team,self)
  end

  def invalid_move
    puts "Your move is invalid."
    player_move
  end

  def wins
    @score += 1
  end

  def self.all
    @@all_players
  end


end


#  get player name
# player chooses team
# player makes moves
# score increments if player wins