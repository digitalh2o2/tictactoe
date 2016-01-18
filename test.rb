class Player
	attr_accessor :name, :character
	def initialize(name, character)
		@name = name
		@character = character
	end
end

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

@used_numbers = []

class Board
	attr_accessor :one, :two, :three, :four, :five, :six, :seven, :eight, :nine
	

	
	def display
		puts ""
		puts " #{$one}  |  #{$two}  |  #{$three}"
		puts "--------------"
		puts " #{$four}  |  #{$five}  |  #{$six}"
		puts "--------------"
		puts " #{$seven}  |  #{$eight}  |  #{$nine}"
		puts ""
	end
end

def check_winner(player, character)
	winner = false
	if  $one == $two && $two == $three ||
		$four == $five && $five == $six ||
		$seven == $eight && $eight == $nine ||
		$one == $four && $four == $seven ||
		$two == $five && $five == $eight ||
		$three == $six && $six == $nine ||
		$one == $five && $five == $nine ||
		$seven == $five && $five == $three
		winner = true
		puts "#{player.name} wins!"
	elsif 
		@used_numbers[8]
			puts "Stalemate"
			winner = true
	end
	if winner == false
		change_player
	end
end

def turn(player, move)
	case move
	when "1"
		if @used_numbers.include?(move)
			puts ""
			puts "That square is occupied, please choose another"
			puts ""
			move = gets.chomp
			turn(player, move)
		else
			$one = player.character
			@used_numbers.push(move)
		end
	when "2"
		if @used_numbers.include?(move)
			puts ""
			puts "That square is occupied, please choose another"
			puts ""
			move = gets.chomp
			turn(player, move)
		else
			$two = player.character
			@used_numbers.push(move)
		end
	when "3"
		if @used_numbers.include?(move)
			puts ""
			puts "That square is occupied, please choose another"
			puts ""
			move = gets.chomp
			turn(player, move)
		else
			$three = player.character
			@used_numbers.push(move)
		end
	when "4"
		if @used_numbers.include?(move)
			puts ""
			puts "That square is occupied, please choose another"
			puts ""
			move = gets.chomp
			turn(player, move)
		else
			$four = player.character
			@used_numbers.push(move)
		end
	when "5"
		if @used_numbers.include?(move)
			puts ""
			puts "That square is occupied, please choose another"
			puts ""
			move = gets.chomp
			turn(player, move)
		else
			$five = player.character
			@used_numbers.push(move)
		end
	when "6"
		if @used_numbers.include?(move)
			puts ""
			puts "That square is occupied, please choose another"
			puts ""
			move = gets.chomp
			turn(player, move)
		else
			$six = player.character
			@used_numbers.push(move)
		end
	when "7"
		if @used_numbers.include?(move)
			puts ""
			puts "That square is occupied, please choose another"
			puts ""
			move = gets.chomp
			turn(player, move)
		else
			$seven = player.character
			@used_numbers.push(move)
		end
	when "8"
		if @used_numbers.include?(move)
			puts ""
			puts "That square is occupied, please choose another"
			puts ""
			move = gets.chomp
			turn(player, move)
		else
			$eight = player.character
			@used_numbers.push(move)
		end
	when "9"
		if @used_numbers.include?(move)
			puts ""
			puts "That square is occupied, please choose another"
			puts ""
			move = gets.chomp
			turn(player, move)
		else
			$nine = player.character
			@used_numbers.push(move)
		end
	when "godmode"
			$one = player.character
			$two = player.character
			$three = player.character
			$four = player.character
			$five = player.character
			$six = player.character
			$seven = player.character
			$eight = player.character
			$nine = player.character
	else
		puts ""
		puts "That doesn't even make any sense. Try again."
		puts ""
		move = gets.chomp
		turn(player, move)
	end
end


def startgame
	set
	puts "Player 1, what is your name?"
	puts ""
	player1 = gets.chomp
	@player1 = Player.new(player1, "X")
	puts ""
	puts "#{@player1.name}, you are #{@player1.character}"
	puts ""
	puts "Player 2, what is your name?"
	puts ""
	player2 = gets.chomp
	@player2 = Player.new(player2, "O")
	puts ""
	puts "#{@player2.name}, you are #{@player2.character}"
	puts ""
	puts "Press enter to begin"
	gets.chomp
	@board = Board.new
	@board.display
end

def change_player
	if $turn == 0
		player1Turn
	else
		player2Turn
	end
end

def player1Turn
	puts "#{@player1.name}'s turn. Which square would you like?"
	puts ""
	move = gets.chomp
	while @used_numbers.include?(move)
		puts ""
		puts "That square is occupied, please choose another"
		puts ""
		move = gets.chomp
	end
	if move == (1 || 2 || 3 || 4 || 5 || 6 || 7 || 8 || 9)
		puts ""
		turn(@player1, move)
		@board.display
		$turn += 1
		check_winner(@player1, "X")
	else
		turn(@player1, move)
		puts ""
		@board.display
		$turn += 1
		check_winner(@player1, "X")
	end
end

def player2Turn
	puts "#{@player2.name}'s turn. Which square would you like?"
	puts ""
	move = gets.chomp
	while @used_numbers.include?(move)
		puts ""
		puts "That square is occupied, please choose another"
		puts ""
		move = gets.chomp
	end
	if move == (1 || 2 || 3 || 4 || 5 || 6 || 7 || 8 || 9)
		puts ""
		turn(@player2, move)
		@board.display
		$turn -= 1
		check_winner(@player2, "O")
	else
		turn(@player2, move)
		puts ""
		@board.display
		$turn -= 1
		check_winner(@player2, "O")
	end
end

startgame
change_player