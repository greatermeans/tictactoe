require 'pry'

class Board

attr_accessor :squares, :remaining

  def initialize
    @squares = []
    9.times do |whatever|
      @squares << Square.new
    end
    current_board
    @remaining = (1..9).to_a
  end

  def current_board
    puts "Current Board"
    puts "#{squares[0].value}|#{squares[1].value}|#{squares[2].value}"
    puts "#{squares[3].value}|#{squares[4].value}|#{squares[5].value}"
    puts "#{squares[6].value}|#{squares[7].value}|#{squares[8].value}"
  end

  def winning_chain
    winning_chain = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  end

  def new_move(move,team,player)
    if valid?(move) 
      squares[move-1].value = team
      current_board
      @remaining.delete(move)
    else 
      player.invalid_move(player)
    end
  end

  def valid?(move)
    squares[move-1].value == "_" ? true : false
  end

  def who_won?(player,computer)
      if winner?(player) == true
        return player
      elsif winner?(computer) == true
        return computer
      else
        false
      end
  end

  def you_won(player)
    player.wins
    if player.class == Person
      puts "You got lucky!"
    else
      puts "You lose; Computer Wins!"
    end
  end


  def tie?(player,computer) 
    # puts "Its a tie!"
    who_won?(player,computer) == false && @remaining.count == 0
  end

  def winner?(player)
    winning_chain.each {|set| return true if winner_chain(set,player)}
    return false
  end

  def winner_chain(set,player)
    [squares[set[0]].value,squares[set[1]].value,squares[set[2]].value].uniq.join == player.team
  end


end



# starts with blank squares
# monitors/saves momvements
# if player moves = a winning chain then player wins
# communicate winner/loser
