class Mastermind

    def initialize
        @colors = ["black", "red", "yellow", "green", "white", "blue"]
        while true
            player_guess
        end
    end

    def generate_code
        [@colors.sample, @colors.sample, @colors.sample, @colors.sample]
    end

    def player_guess
        puts "Please guess:"
        guess = gets.chomp
        guess_array = guess.split(", ")
        until guess_array.all? { |color| @colors.include? color.downcase }
            puts "Invalid format or colors.  Please try again:"
            guess = gets.chomp
            guess_array = guess.split(", ")
        end
    end

    def check_guess
    end

end

game = Mastermind.new