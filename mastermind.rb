class Mastermind

	#the initialize includes the choices for the game, the master code which is an empty array. Final answer is the result of choices
	def initialize
		@choices = ["R", "G", "B", "Y", "H", "P"]
		@master_code = @choices.sample(4)
	end

	$turn = 0

	#start of the game. Leads player to instructions for the game and then to choices. 
	def start
		puts "Welcome to Mastermind!"
		puts "What is your name?"
		name = gets.chomp.capitalize
		puts "Welcome #{name}! Here are the instructions for Mastermind"
		puts "---------------------------- "
		print @master_code
		puts "-----------------------------"
		instructions
		make_guess
	end

	#here are the instructions given to the player before the game begins.
	def instructions
		puts """Mastermind is a code-breaking game that helps develop deductive reasoning and logic by requiring players to deduce secret combinations of colors with minimal clues. After each of these chances, the creator of the code (in this case, the computer) must reveal how many pegs are the correct color in the correct location, or the correct color in the incorrect location, or completely incorrect. With this little information, the code breaker must improve upon his previous guess to crack the code. For this game we'll allow you to have 12 guesses before requiring a forfeit."""
		puts "Please push Enter to continue"
		gets.chomp
	end

	#this gets the players input from the 6 colors available and splits them into an array.
	def make_guess
		puts "Please select four colors as your guess. They can either mix and match or all be the same"
		puts "No spaces please!"
		puts "Your choices are 'R', 'G', 'B', 'Y', 'H', 'P'."
		guess = gets.chomp.upcase
		compare(guess)
	end

	#this receives the players input and converts it into a new array with an index. 
	def compare(guess)
		feedback = []
		guess.split('').each_with_index do |color, index|
			if @master_code.include?(color)
				if @master_code[index] == guess[index]
					feedback << "O"
				else
					feedback << "X"
				end
			end
		end
		print feedback.to_s
	end


end



test = Mastermind.new
puts test.start