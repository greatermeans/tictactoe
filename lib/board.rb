require 'pry'

class Board

  def initialize
    9.times do |whatever|
      Square.new
    end
    Board.current_board
  end

  def new_game
    player = Person.new
    computer = Computer.new
  end

  def self.current_board
    puts "Current Board"
    puts "#{Square.all[0].value}|#{Square.all[1].value}|#{Square.all[2].value}"
    puts "#{Square.all[3].value}|#{Square.all[4].value}|#{Square.all[5].value}"
    puts "#{Square.all[6].value}|#{Square.all[7].value}|#{Square.all[8].value}"
  end

  def self.winning_chain
    winning_chain = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,7],[0,4,8],[2,4,6]]
  end

  def self.new_move(move,team,player)
    if valid?(move) 
      Square.all[move-1].value = team
      self.current_board
      Square.remaining.delete(move)
      player.moves << move
    else 
      player.invalid_move
    end
  end

  def self.valid?(move)
    Square.all[move-1].value == "_" ? true : false
  end

  def self.who_won?(player,computer)

      if winner?(player) == true
        player.wins
        puts "You got lucky!"
      elsif winner?(computer) == true
        computer.wins
        puts "You lose; Computer Wins!"
      else
        false
      end
  end

  def self.tie?(player,computer)
    if winner?(human,computer) == false 
      puts "Its a tie!"
    end
  end

  def self.winner?(player)
    self.winning_chain.each do |set|
      if [Square.all[set[0]].value,Square.all[set[1]].value,Square.all[set[2]].value].uniq.join == player.team
        binding.pry
        return true
      else
        return false
      end
    end
  end


end



# starts with blank squares
# monitors/saves momvements
# if player moves = a winning chain then player wins
# communicate winner/loser
