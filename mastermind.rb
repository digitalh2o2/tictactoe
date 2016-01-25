class Mastermind

	#the initialize includes the choices for the game, the master code which is an empty array. Final answer is the result of choices
	def initialize
		@choices = ["R","G","B","Y","H","P"]
		@master_code = @choices.sample(4)
		@turn = 0
	end


	#start of the game. Leads player to instructions for the game and then to choices. 
	def start
		puts "Welcome to Mastermind!"
		puts "What is your name?"
		name = gets.chomp.capitalize
		puts "Welcome #{name}! Here are the instructions for Mastermind"
		puts "---------------------------- "
		puts "-----------------------------"
		instructions
		play_game
	end

	#here are the instructions given to the player before the game begins.
	def instructions
		puts """Mastermind is a code-breaking game that helps develop deductive reasoning and logic by requiring players to deduce secret combinations of colors with minimal clues. After each of these chances, the creator of the code (in this case, the computer) must reveal how many pegs are the correct color in the correct location, or the correct color in the incorrect location, or completely incorrect. With this little information, the code breaker must improve upon his previous guess to crack the code. For this game we'll allow you to have 12 guesses before requiring a forfeit."""
		puts "Please push Enter to continue"
		gets.chomp
	end

	#this will provide the results the player and see if they won or not
	def play_game
		while @turn < 13
			puts "Lets see if you figured out my code!"
			puts "Please select four colors as your guess. They can either mix and match or all be the same"
			puts "No spaces please!"
			puts "Your choices are 'R', 'G', 'B', 'Y', 'H', 'P'."
			guess = gets.chomp.upcase
			feedback = compare(guess)
			if feedback == ["O", "O", "O", "O"]
				puts "~~~~~~~~~~~"
				puts "You won!!!!"
				puts "~~~~~~~~~~~"
				puts "You have cracked the code of #{@master_code}"
				exit
			else
				puts "Sorry! Guess again"
				puts "Here is currently what you have right #{feedback}"
				puts "---------------"
				puts "---------------"
				@turn += 1
				puts "That was turn number " + @turn.to_s
				play_game
			end
			puts "You reached your max of 12 turns....game over!"
		end
	end

	#this receives the players input and converts it into a new array with an index. 
	def compare(guess)
		feedback = []
		guess.split('').each_with_index { |color, index|
			if @master_code.include?(color)
				if @master_code[index] == guess[index]
					feedback << "O"
				else
					feedback << "X"
				end
			end
		}
		feedback.to_a
	end


end



test = Mastermind.new
puts test.start