class Computer
  attr_accessor :score, :team, :name, :level

  def initialize(level,team)
    @score = 0
    @team = team
    difficulty(level)
  end

  def difficulty(level)
    if level == 3
      @name = "Mama Bear"
      @level = LevelThree.new(@team)
    elsif level == 2
      @name = "Young Bear"
      @level = LevelTwo.new(@team)
    elsif level == 1
      @name = "Cub"
      @level = LevelOne.new(@team)
    end
  end

  def wins
    @score += 1
  end

end


