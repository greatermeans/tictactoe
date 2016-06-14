require 'pry'

class Runner
  def start
    puts "What is your name?"
    name = gets.chomp
    human = Person.new(name)
    puts "Please choose a team (Suggested: X or O)."
    human.choose_team
    binding.pry
    puts "You chose #{@team}. You are playing against Computer."
    player_move
  end
end