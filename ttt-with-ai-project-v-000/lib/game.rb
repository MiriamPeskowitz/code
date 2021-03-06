require 'pry'

class Game
	attr_accessor :player_1, :player_2, :board

	WIN_COMBINATIONS = [
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,3,6],
     [1,4,7],
     [2,5,8],
     [0,4,8],
     [6,4,2]
   ]

	 def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		 @player_1 = player_1
		 @player_2 = player_2
	   	 @board = board
	 end

	 def current_player

		# @board.turn_count.even? ? @player_1 : @player_2
		 binding.pry
		 @board.turn_count % 2 == 0 ? @player_1 : @player_2
	
	 end

	 def over?
		won? || draw? # diff draw? or won?
 	 end

	 
	 def won?
		 # I used this from the earlier version/trying to figure out the logic. Ask coaches. Def get help. 
	 	WIN_COMBINATIONS.detect do |combo|
      		@board.cells[combo[0]] == @board.cells[combo[1]] &&
      		@board.cells[combo[1]] == @board.cells[combo[2]] &&
      		@board.taken?(combo[0]+1)
    	end
	 end


	 def draw?
		 @board.full? && !won?
	#		if cells are full, but no winning combo, use board.full
	 end

	 def winner
		 if winning_combo = won? 
		 	@winner = @board.cells[winning_combo.first]
		 	#and ..last player, or first to get to Win_combos?
			# if WIN_COMBINATIONS = won
			# 	@board[WIN_COMBINATIONS.first]??
	 	end
	 end

	 def start
		 play
		 #what else. Do I need start if it's really just #play? 
	 end


	 def turn
		@player = current_player

	    current_move = @player.move(@board)
	    binding.pry
	    if !@board.valid_move?(current_move)
	      turn
	    else
	      puts "Turn: #{@board.turn_count+1}\n"
	      @board.display	
	      @board.update(current_move, @player)


	      puts "#{@player.token} moved #{current_move}"
	      @board.display
	      puts "\n\n\n"
	    end
	   
	 end

	 def play
	 	while !over?
	 		turn
	 	end
	 	if won?
	 		puts "Congratulations #{winner}!"
	 		#how to add puts "Want to play again?""
	 	elsif draw?
	 		puts "Cat's Game!"
	 		# how to get it out of the loop? 
	 	end
	 end


	  #add a play_again method? after win/draw? 
	  # how to quit from within a game? 
	  #input = "quit"


end
