#this class will store the players information
class Player
	attr_accessor :name, :symbol

	def initialize(name, symbol)
		@name = name
		@symbol = symbol
	end
end

class Game
	#these are the winning combinations that will end the game
	#$winning_combinations = [[012],[048],[036],[147],[258],[246],[345],[678]]

	#this gathers the information of the players and uses the Player class to add the information
	def start
		puts "Let's play a game of Tic Tac Toe!"
		puts "Player one, what is your name and what symbol would you like?"
		game_name = gets.chomp
		symbol = gets.chomp
		puts "Welcome #{game_name}, you'll be #{symbol} for this game"
		puts "Player two, what is your name and what symbol would you like?"
		game_name2 = gets.chomp
		symbol2 = gets.chomp
		puts "Welcome #{game_name}, you'll be #{symbol2} for this game"
		player1 = Player.new(game_name, symbol)
		player2 = Player.new(game_name2, symbol2)
		board
	end

	#this presents the board with locations to the player
	def board
		puts "Below is the board"
		puts """"
		puts """"
	end
end




Game.new.start


