#in master mind the code breaker has 10 turns to try and guess secret code 
class Codebreaker 
  def initialize
    @turns = 3 #10 # player has this many round to get the secret code right
  
  end

  def play
    puts "Welcome to Mastermind! code breaker"
    puts "Try to guess the secret code. Enter 4 colors separated by commas."
    puts "Available colors: red, blue, green, yellow, orange, purple."
    puts "You have #{@turns} turns. Good luck!"

    while @turns > 0
      print "turn #{4 - turns}: Enter your guess  code breaker"
    end
  end






end
start = Codebreaker.new
start.play