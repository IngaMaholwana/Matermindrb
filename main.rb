# okay now i have to put all together the 
require_relative 'codemaker'
require_relative 'codebreaker'

class Game
  def initialize
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new
    @turns = 10
    @score = { codemaker: 0, codebreaker: 0 }
  end

  def start
    puts "Welcome to Mastermind!"
    setup_codemaker
    play_round
    switch_roles if game_over?
  end

  private

  def setup_codemaker
    puts "Codemaker: It's your turn to set the secret code."
    @codemaker.fact_check
    @secret_code = @codemaker.secret_code
    clear_screen
  end

  def play_round
    puts "Codebreaker: It's your turn to guess the secret code!"
    @turns.times do |turn|
      puts "\nTurn #{turn + 1} of #{@turns}"
      guess = @codebreaker.play
      feedback = provide_feedback(guess)
      puts "Feedback: #{feedback[:exact]} exact matches, #{feedback[:partial]} partial matches."
      if feedback[:exact] == 4
        puts "Congratulations, Codebreaker! You've cracked the code!"
        @score[:codebreaker] += 1
        return
      end
    end
    puts "The Codebreaker failed to guess the code. Codemaker wins this round!"
    @score[:codemaker] += 1
  end

  def provide_feedback(guess)
    exact_matches = 0
    partial_matches = 0
    secret_code_copy = @secret_code.clone

    # Check for exact matches
    guess.each_with_index do |color, index|
      if color == secret_code_copy[index]
        exact_matches += 1
        secret_code_copy[index] = nil # Mark this color as used
      end
    end

    # Check for partial matches
    guess.each do |color|
      next unless secret_code_copy.include?(color)

      partial_matches += 1
      secret_code_copy[secret_code_copy.index(color)] = nil # Mark this color as used
    end

    { exact: exact_matches, partial: partial_matches - exact_matches }
  end

  def switch_roles
    puts "Switching roles..."
    temp_codemaker = @codemaker
    @codemaker = @codebreaker
    @codebreaker = temp_codemaker
    @turns = 10
    start
  end

  def clear_screen
    puts "\e[H\e[2J" # Clears the terminal screen
  end

  def game_over?
    puts "Game over! Final scores:"
    puts "Codemaker: #{@score[:codemaker]}"
    puts "Codebreaker: #{@score[:codebreaker]}"
    puts "Play again? (yes/no)"
    gets.chomp.downcase != 'yes'
  end
end

# To play the game:
game = Game.new
game.start
