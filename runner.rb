require 'require_all'
require_all 'lib/*.rb'
require 'pry'
  
class Runner
  def self.start
    # Get player name and teams
    puts "What is your name?"
    name = gets.chomp
    human = Person.new(name)
    computer = Computer.new
    human.choose_team
    # binding.pry
    human.team == "X" ? computer.team = "O" : computer.team = "X"
    # Set up game board
    new_game = Board.new
    # Loop until ends
    # while Board.winner? == false

    while Board.who_won?(human,computer) == false

      human.player_move 
      computer.computer_move if Board.who_won?(human,computer) == false
      Board.tie?(human,computer) if Square.remaining.count == 0
    end
    
    


    puts "Your Score:#{human.score}"
    puts "Computer Score:#{computer.score}"

  end

end

Pry.start