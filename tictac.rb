class Game

	attr_accessor :player1, :player2, :board

	def initialize
		@player1 = Player.new("Player 1", "X")
		@player2 = Player.new("Player 2", "O")
		@board = Board.new
	end

	#these are the winning combinations that will end the game
	#$winning_combinations = [[012],[048],[036],[147],[258],[246],[345],[678]]

	#this gathers the information of the players and uses the Player class to add the information
	def start
		puts "Let's play a game of Tic Tac Toe!"
		puts "#{@player1.name}, your symbol will be #{@player1.symbol}"
		puts "#{@player2.name}, your symbol will be #{@player2.symbol}"	
		show_board
	end

	#this presents the board with locations to the player
	def show_board
		puts "Below is the board"
		puts "********************"
		puts "------|------|------"
		puts "  1   |  2   |  3   "
		puts "------|------|------"
		puts "  4   |  5   |  6   "
		puts "------|------|------"
		puts "  7   |  8   |  9   "
		puts "------|------|------"
		puts "********************"
		@board = Board.new
		@board.instructions
	end

	#this will allow the player to pick a location
	def make_move
		puts "From the locations above, please make a selection by number"
		move = gets.chomp.to_i
	end
end

#this will be the board that is used during the game
class Board

	@board = (0..8).to_a

	def instructions
		puts "From the graph above, please make a selection of where you would like to move during the game."
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

