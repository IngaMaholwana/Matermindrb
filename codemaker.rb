#mastermind is a game where 1 player makes a random 4 colour coded pattern and the second player has to guess it
#the 2nd player has 10 chances in a normal game and if they are close another colour coded clue pin is given to signify if close or not
#if the  code is not cracked the 1st player wins and game switch and they have a point player 2 now make his own colour code 
class Codemaker
  attr_accessor :secret_code

  def initialize
    @secret_code.to_a #  = [] # Initialize the secret code as an empty array
  end

  def fact_check
    puts "Player 1: You need to input 4 separate colors to create the secret code."
    puts "Available colors: red, blue, green, yellow, orange, purple."

    loop do
      print "Enter 4 colors separated by spaces: "
      input = gets.chomp.split.map(&:strip) # Get user input, split into words, and remove extra spaces

      if input.size == 4
        @secret_code = input # Store the valid input as the secret code
        puts "Secret code has been set: #{@secret_code.join(', ')}" #this is what i am using to debug the secret code array values
        break # Exit the loop once valid input is provided
      else
        puts "Invalid input. Please enter exactly 4 colors."
      end
    end
  end
end
# Instantiate the Codemaker class and call the fact_check method
start = Codemaker.new
start.fact_check