#in master mind the code breaker has 10 turns to try and guess secret code 
class Codebreaker 
  def initialize
    @guesses = [] # player guesses will be stored here
  end

  def play
    puts "Welcome to Mastermind! code breaker"
    puts "Try to guess the secret code. Enter 4 colors separated by commas."
    puts "Available colors: red, blue, green, yellow, orange, purple."

    
    print "Enter your guess  code breaker:  "
    input = gets.chomp.split(",").map(&:strip)
    if input.size == 4
      @guesses << input
        # puts "You have set your guess set: #{@guesses.join(', ')}"
      
    else
      puts "Invalid input. Please enter 4 colors separated by commas."
    end
    
  end
  






end
# start = Codebreaker.new
# start.play