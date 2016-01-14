class Game

	attr_accessor :player1, :player2, :board

	def initialize
		@board = Board.new
		@player1 = Player.new("Player 1", "X")
		@player2 = Player.new("Player 2", "O")
	end

	#these are the winning combinations that will end the game
	def win
		$winning_combinations = [[0,1,2],[0,4,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]]
	end

	#this gathers the information of the players and uses the Player class to add the information
	def start
		puts "Let's play a game of Tic Tac Toe!"
		puts "What is your name Player 1?"
		name = gets.chomp
		puts "Welcome #{name}! You will be #{@player1.name} and your symbol will be #{@player1.symbol}!"
		puts "What is your name Player 2?"
		second_name = gets.chomp
		puts "Welcome #{second_name}! You will be #{@player2.name} and your symbol will be #{@player2.symbol}!"	
		board.show_board
	end

	

	#this will allow the player to pick a location
	def make_move
		puts "#{@player1.name}, please make your selection. Remember to use the numbers 1-9 for it to be valid"			
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
		@board = Board.new
		board.instructions
	end


	def instructions
		puts "From the graph above, please make a selection of where you would like to move during the game."
		@game = Game.new
		game.make_move
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

