class Mastermind

    COLORS = ["black", "red", "yellow", "green", "white", "blue"]
  
    def initialize
      case codemaster?
      when true
        Codemaster.new
      when false
        Codebreaker.new
      else
        puts "uh oh"
      end
    end
  
    def codemaster?
      print "Would you like to be the codemaster?: "
      case get_codemaster_input
        when "yes" || "y"
          true
        when "no" || "n"
          false
        else
          puts "uh oh.  the request_codemaster_input method must be broken"
      end
    end      
  
    def get_codemaster_input
      acceptable_input = ["yes", "y", "no", "n"]
      codemaster = gets.chomp.downcase
      until acceptable_input.include? codemaster
        print "Please use \"yes\", \"y\", \"no\", or \"n\" to select your choice: "
        codemaster = gets.chomp.downcase
      end
      codemaster
    end
  
    def get_code_input
      input = gets.chomp.split(", ")
      until input.all? { |color| COLORS.include? color.downcase } && input.length == 4
        puts "Invalid format or colors.  Please try again:"
        input = gets.chomp.split(", ")
      end
      input
    end
  end
  
  
  
  class Codemaster < Mastermind
  
    def initialize
      puts "Code under construction.  Please excuse the mess"
      print "Please provide a code, codemaster: "
      @current_guess = [COLORS.sample, COLORS.sample, COLORS.sample, COLORS.sample]
      @previous_guesses = Array.new
      @turn_count = 1
      @player_code = get_code_input
      puts @player_code.join(", ")
      # @previous_guesses.push(@current_guess)
      # computer_guess
      while @previous_guesses.include? @current_guess
        computer_guess
        @previous_guesses << @current_guess
        @turn_count += 1
        break if @current_guess == @player_code
      end
      puts "Congratulations!  It took the computer #{@turn_count} #{@turn_count > 1 ? "guesses" : "guess"} to break your code!"
      print @previous_guesses
    end
  
    def computer_guess
      @current_guess.each_with_index do |guess, index|
        if guess == @player_code[index]
          next
        else
          @current_guess[index] = COLORS.sample
        end
      end
      puts @current_guess.join(", ")
    end
  
    def winner?
      @current_guess == @player_code
    end
  
  end
  
  class Codebreaker < Mastermind
  
    def initialize
      @code = generate_code
      @player_guess = nil
      @turn_count = 0
      print "Answer key: " + @code.join(", ") + "\n"
      until winner?
          @player_guess = player_guess
          provide_feedback
      end
      puts "Congratulations!  You've won the game in #{@turn_count} #{@turn_count > 1 ? "guesses!" : "guess!"}"
    end
  
    def generate_code
      [COLORS.sample, COLORS.sample, COLORS.sample, COLORS.sample]
    end
  
    def player_guess
        print "Please guess: "
  
        # I can refactor this to be a Mastermind class method available to both game classes
        guess_array = get_code_input
  
        # increase turn count.  after 8/10/12 turns the player will lose
        @turn_count += 1
  
        # return the player's guess as an array to be checked against the real code
        return guess_array
    end
  
    def winner?
        # game is won when the player guesses the correct code
        @code == @player_guess
    end
  
    def provide_feedback
        black, white = check_guess
        puts "#{black} black pegs; #{white} white pegs"
    end
  
    def check_guess
  
      # intialize local variables
      black = 0
      white = 0
      guess_copy = @player_guess.dup
      code_copy = @code.dup
  
      # determine number of black pegs
      guess_copy.each_with_index do |item, index|
          if item == code_copy[index]
              black += 1
              code_copy[index] = "blacked out"
          end
      end
  
      # determine number of white pegs
      guess_copy.each_with_index do |item, index|
  
          # if black peg was assigned ealier, skip this iteration
          if code_copy[index] == "blacked out"
              next
          end
  
          # if correct color but out of place, increment white; nil code_copy to prevent duplicating white-count
          if code_copy.include? item
              white += 1
              code_copy[code_copy.index(item)] = "whited out"
          end
      end 
      return black, white
    end
  end
  
  Mastermind.new
