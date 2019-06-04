class Mastermind

    COLORS = ["black", "red", "yellow", "green", "white", "blue"]

    def initialize
        @code = generate_code
        @player_guess = nil
        @turn_count = 0
        print "Answer key: " + @code.join(", ") + "\n"
        until winner?
            @player_guess = player_guess
            provide_feedback
        end
        puts "Congratulations!  You've won the game!"
    end

    def generate_code
        [COLORS.sample, COLORS.sample, COLORS.sample, COLORS.sample]
    end

    def player_guess
        print "Please guess: "
        guess_array = gets.chomp.split(", ")
        until guess_array.all? { |color| COLORS.include? color.downcase } && guess_array.length == 4
            puts "Invalid format or colors.  Please try again:"
            guess_array = gets.chomp.split(", ")
        end

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
        print "Player guess: " + @player_guess.join(", ") + "\n"
        print "Actual code: " + @code.join(", ") + "\n"
        puts "#{black} black pegs; #{white} white pegs"
    end

    def check_guess

        # intialize local variables
        black = 0
        white = 0
        guess_copy = @player_guess
        code_copy = @code

        # determine number of black pegs
        guess_copy.each_with_index do |item, index|
            if item == code_copy[index]
                black += 1
                code_copy[index] = nil
            end
        end

        # determine number of white pegs
        guess_copy.each_with_index do |item, index|

            # if black peg was assigned ealier, skip this iteration
            unless code_copy[index]
                next
            end

            # if correct color but out of place, increment white; nil code_copy to prevent duplicating white-count
            if code_copy.include? item
                white += 1
                code_copy[code_copy.index(item)] = nil
            end
        end
        return black, white
    end
end

game = Mastermind.new