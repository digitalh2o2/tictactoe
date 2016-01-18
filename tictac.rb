#this took a lot of time and is very raw. Helped to see others and will try to improve as time goes on
#Will try to reduce code by a good chunk and see if I can clump the whole thing in just a class or two instead of outside of classes


#player class that goes to Game class
class Player
	attr_accessor :name, :symbol

	def initialize(name, symbol)
		@name = name
		@symbol = symbol
	end
end

#this is the set for the board and matches the 'move = gets.chomp' from the players
def set
	$one = "1"
	$two = "2"
	$three = "3"
	$four = "4"
	$five = "5"
	$six = "6"
	$seven = "7"
	$eight = "8"
	$nine = "9"
	$turn = 0		
end

#stores the numbers that have been used. 
@used_numbers = []



class Game
	attr_accessor :one, :two, :three, :four, :five, :six, :seven, :eight, :nine

	def display
		puts ""
		puts "Below is the board"
		puts "********************"
		puts "--------|---------|---------"
		puts "  #{$one}     |  #{$two}      |  #{$three}   "
		puts "--------|---------|---------"
		puts "  #{$four}     |  #{$five}      |  #{$six}   "
		puts "--------|---------|---------"
		puts "  #{$seven}     |  #{$eight}      |  #{$nine}  "
		puts "--------|---------|---------"
		puts "********************"
		puts ""
	end
end
	
#signals whose turn it is
def current_player
	if $turn == 0
		playerone
	else
		playertwo
	end
end

#checks to see if there is a winner or a draw. 
def winner(player, symbol)
	winner = false
	if $one == $two && $two == $three ||
		$one == $five && $five == $nine ||
		$one == $four && $four == $seven ||
		$two == $five && $five == $eight ||
		$three == $six && $six == $nine ||
		$three == $five && $five == $seven ||
		$four == $five && $five == $six ||
		$seven == $eight && $eight == $nine
		winner = true
		puts "Congrats #{player.name}, you won!"
	elsif @used_numbers[8]
		puts "Draw!"
		winner = true
	end
	if winner == false
		current_player
	end
end

#this has the method for player one
def playerone
	puts "#{@player1.name}, please make your selection. Remember, numbers 1-9 for it to be valid."
	move = gets.chomp
	while @used_numbers.include?(move)
		puts "That's already taken!"
		puts "Please select another location"
		move = gets.chomp.to_s
	end
	if move == (1 || 2 || 3 || 4 || 5 || 6 || 7 || 8 || 9)
		make_move(@player1, move)
		@game.display
		$turn += 1
		winner(@player1, "X")
	else
		make_move(@player1, move)
		@game.display
		$turn += 1
		winner(@player1, "X")
	end
end

def playertwo
	puts "#{@player2.name}, please make your selection. Remember, numbers 1-9 for it to be valid."
	move = gets.chomp
	while @used_numbers.include?(move)
		puts "That's already taken!"
		puts "Please select another location"
		move = gets.chomp
	end
	if move == (1 || 2 || 3 || 4 || 5 || 6 || 7 || 8 || 9)
		make_move(@player2, move)
		@game.display
		$turn -= 1
		winner(@player2, "O")
	else
		make_move(@player2, move)
		@game.display
		$turn -= 1
		winner(@player2, "O")
	end
end


#this starts off the game and gives the symbol for player 1 and player 2
def start
	set
	puts "Let's play a game of Tic Tac Toe!"
	puts "What is your name Player 1?"
	player1 = gets.chomp.capitalize
	@player1 = Player.new(player1, "X")
	puts "Welcome #{@player1.name}, you'll be #{@player1.symbol} for this game."
	puts "What is your name Player 2?"
	player2 = gets.chomp.capitalize
	@player2 = Player.new(player2, "O")
	puts "Welcome #{@player2.name}, you'll be #{@player2.symbol} for this game."
	@game = Game.new
	@game.display
end

#shows the current board to both players to see if everything is taken up or free


#this is the method that takes the arguments from the playerone and playertwo methods. Built of cases
def make_move(player, move)
	case move
		when "1" 
			if @used_numbers.include?(move)
				puts "That's already taken my friend."
				puts "Please select another location!"
				move = gets.chomp
				make_move(player, move)
			else
				$one = player.symbol
				@used_numbers << move
			end
		when "2"
			if @used_numbers.include?(move)
				puts "That's already taken my friend."
				puts "Please select another location!"
				move = gets.chomp
				make_move(player, move)
			else
				$two = player.symbol
				@used_numbers << move
			end
		when "3"
			if @used_numbers.include?(move)
				puts "That's already taken my friend"
				puts "Please select another location!"
				move = gets.chomp
				make_move(player, move)
			else
				$three = player.symbol
				@used_numbers << move
			end
		when "4"
			if @used_numbers.include?(move)
				puts "That's already taken my friend"
				puts "Please select another location!"
				move = gets.chomp
				make_move(player, move)
			else
				$four = player.symbol
				@used_numbers << move
			end
		when "5"
			if @used_numbers.include?(move)
				puts "That's already taken my friend"
				puts "Please select another location!"
				move = gets.chomp
				make_move(player, move)
			else
				$five = player.symbol
				@used_numbers << move
			end
		when "6"
			if @used_numbers.include?(move)
				puts "That's already taken my friend"
				puts "Please select another location!"
				move = gets.chomp
				make_move(player, move)
			else
				$six = player.symbol
				@used_numbers << move
			end
		when "7"
			if @used_numbers.include?(move)
				puts "That's already taken my friend"
				puts "Please select another location!"
				move = gets.chomp
				make_move(player, move)
			else
				$seven = player.symbol
				@used_numbers << move
			end
		when "8"
			if @used_numbers.include?(move)
				puts "That's already taken my friend"
				puts "Please select another location!"
				move = gets.chomp
				make_move(player, move)
			else
				$eight = player.symbol
				@used_numbers << move
			end
		when "9"
			if @used_numbers.include?(move)
				puts "That's already taken my friend"
				puts "Please select another location!"
				move = gets.chomp
				make_move(player, move)
			else
				$nine = player.symbol
				@used_numbers << move
			end
		end

end

start
current_player


