class Game

	attr_accessor :player1, :player2, :board

	def initialize
		@board = Board.new
		@player1 = Player.new("Player 1", "X")
		@player2 = Player.new("Player 2", "O")
	end

	@used_numbers = []
	$turn = 0
	#these are the winning combinations that will end the game
	def win
		$winning_combinations = [[0,1,2],[0,4,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]]
	end

	#determins the player while adding to see if there's a draw
	def change_players
		if $turn == 0
			player_one
		else
			player_two
		end
	end

	#this gathers the information of the players and uses the Player class to add the information
	def start
		puts "Let's play a game of Tic Tac Toe!"
		puts "What is your name Player 1?"
		name = gets.chomp.capitalize
		puts "Welcome #{name}! You will be #{@player1.name} and your symbol will be #{@player1.symbol}!"
		puts "What is your name Player 2?"
		second_name = gets.chomp.capitalize
		puts "Welcome #{second_name}! You will be #{@player2.name} and your symbol will be #{@player2.symbol}!"	
		board.show_board
		instructions
		change_players
	end

	#presents instructions to the players
	def instructions
		puts "From the graph above, please make a selection of where you would like to move during the game."
	end

	#this will allow the player to pick a location
	def make_move
		case move
		  when 3 then puts "You have moved to position 4"
		 end		
	end

	def player_one
		puts "#{@player1.name}, please make your selection. Remember to use the numbers 1-9 for it to be valid"	
		move = gets.chomp.to_i-1
		if @used_numbers.include?(move)
			puts "That location is already taken."
			puts "Please select another spot!"
			move = gets.chomp.to_i-1
		elsif move == (0..8)
			puts ""
			make_move(@player1, move)
			board.show_board
			$turn +=1
			win(@player1, "X")
		else
			puts "Not the right selection!"
			move = gets.chomp.to_i-1
		end
	end

	def player_two
		puts "#{@player2.name}, please make your selection. Remember to use the numbers 1-9 for it to be valid."
		move = gets.chomp.to_i-1
		if @used_numbers.include?(move)
			puts "That location is already taken."
			puts "Please select another spot!"
			move = gets.chomp.to_i-1
		elsif move == (0..8)
			puts ""
			make_move(@player2, move)
			board.show_board
			$turn +=1
			win(@player2, "O")
		else
			puts "Not the right selection!"
			move = gets.chomp.to_i-1
		end
	end			
end

#this will be the board that is used during the game
class Board
	attr_accessor :board, :game

	def initialize
		@board = [" ", " ", " ", " ", " " ," ", " ", " "]
	end


	#this presents the board with locations to the player
	def show_board
		puts "Below is the board"
		puts "********************"
		puts "--------|---------|---------"
		puts "  1 #{@board[0]}   |  2 #{@board[1]}    |  3 #{@board[2]}   "
		puts "--------|---------|---------"
		puts "  4 #{@board[3]}   |  5 #{@board[4]}    |  6 #{@board[5]}   "
		puts "--------|---------|---------"
		puts "  7 #{@board[6]}   |  8 #{@board[7]}    |  9 #{@board[8]}   "
		puts "--------|---------|---------"
		puts "********************"
	end
end


#this class will store the players information
class Player
	attr_accessor :name, :symbol

	def initialize(name, symbol)
		@name = name
		@symbol = symbol
	end
end


tictac = Game.new
tictac.start


