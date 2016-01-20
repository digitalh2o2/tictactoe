class Mastermind

	#the initialize includes the choices for the game, the master code which is an empty array. Final answer is the result of choices
	def initialize
		@choices = ["red", "green", "blue", "yellow", "orange", "purple"]
		@master_code = []
		@final_answer = []
	end

	$turn = 0

	#this will hold the ansewr to the game
	def answer
		@master_code = @choices.sample(4)
		#@final_answer << @master_code
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
		make_guess
	end

	def instructions
		puts """Mastermind is a code-breaking game that helps develop deductive reasoning and logic by requiring players to deduce secret combinations of colors with minimal clues. After each of these chances, the creator of the code (in this case, the computer) must reveal how many pegs are the correct color in the correct location, or the correct color in the incorrect location, or completely incorrect. With this little information, the code breaker must improve upon his previous guess to crack the code. For this game we'll allow you to have 12 guesses before requiring a forfeit."""
		puts "Please push Enter to continue"
		gets.chomp
	end

	def make_guess
		puts "Please select four colors as your guess. They can either mix and match or all be the same"
		puts "Your choices are 'red', 'green', 'blue', 'yellow', 'orange', 'purple'."
		guess = gets.chomp.downcase
		guess = guess.split(" ")
		print guess
	end

end



test = Mastermind.new
puts test.start