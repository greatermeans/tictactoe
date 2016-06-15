class Person
  attr_accessor :name, :score, :team

  @@all_players = []

  def initialize(name)
    @name = name
    @score = 0
    @team = nil
    @@all_players << self
    puts "Hello, #{name}! Welcome to TIC TAC TOEEEEE!"
  end

  def self.create_or_find_by_name(name)
    if find_a_player(name) == nil
      Person.new(name)
    else
      find_a_player(name)
    end
  end

  def self.find_a_player(name)
    @@all_players.find {|plyr| plyr.name == name}
  end


  def choose_team
    puts "Please choose a team (Suggested: X or O)."
    @team = gets.chomp
    puts "You chose #{@team}. You are playing against Computer."
  end

  def player_move(new_game)
    puts "Please select a position 1-9."
    move = gets.chomp.to_i
    new_game.new_move(move,@team,self)
  end

  def invalid_move(game)
    puts "Your move is invalid."
    player_move(game)
  end

  def wins
    @score += 1
  end

  def self.all
    @@all_players
  end
end
