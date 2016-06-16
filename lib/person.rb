class Person
  attr_accessor :name, :score, :team

  @@all_players = []

  def initialize(name)
    @name = name
    @score = 0
    @@all_players << self
    @team = nil
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

  def wins
    @score += 1
  end

  def self.all
    @@all_players
  end
end
