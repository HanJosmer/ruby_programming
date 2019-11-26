class TicTacToe

    attr_reader :allowed_moves
    attr_accessor :player_one_turn

    def initialize

        # player one will start
        @player_one_turn = true

        # initialize the game cells
        @cell_map = [:aa, :ab, :ac, :ba, :bb, :bc, :ca, :cb, :cc]

        @cell_translation = {true: "X", false: "O", nil: " "}

        @cells = {
            aa: :nil,
            ab: :nil,
            ac: :nil,
            ba: :nil,
            bb: :nil,
            bc: :nil,
            ca: :nil,
            cb: :nil,
            cc: :nil
        }

        # initialize the permitted moveset
        @allowed_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def play_game
        # welcome players, draw the board, and begin the first turn
        puts ""
        puts "Welcome to Tic Tac Toe!  Players will take turns filling in cells on the board in order to match three in a row."
        puts "Please see the board below for a numerical reference when selecting a cell:"
        puts "  "
        puts "  1 | 2 | 3"
        puts "  ---------"
        puts "  4 | 5 | 6"
        puts "  ---------"
        puts "  7 | 8 | 9"
        puts "  "

        # play game until a winner is chosen
        until winner?
            play_turn
            switch_turns
        end

        # annouce winner of game
        puts "Player #{@player_one_turn ? 2 : 1} has won the game!"
    end

    def draw_board
        puts ""
        puts "  #{@cell_translation[@cells[:aa]]} | #{@cell_translation[@cells[:ab]]} | #{@cell_translation[@cells[:ac]]}"
        puts "  ---------"
        puts "  #{@cell_translation[@cells[:ba]]} | #{@cell_translation[@cells[:bb]]} | #{@cell_translation[@cells[:bc]]}"
        puts "  ---------"
        puts "  #{@cell_translation[@cells[:ca]]} | #{@cell_translation[@cells[:cb]]} | #{@cell_translation[@cells[:cc]]}"
        puts ""
    end

    def play_turn
        print "Player #{@player_one_turn ? 1 : 2}, you're up!  Please choose a cell: "
        move = player_choice
        update_allowed_moves move
        update_board move
        draw_board
    end

    def winner?

        # define win condition
        win_conditions = [@cells[:aa] == @cells[:ab] && @cells[:ab] == @cells[:ac] && @cells[:aa] != :nil, # top row
                          @cells[:ba] == @cells[:bb] && @cells[:bb] == @cells[:bc] && @cells[:ba] != :nil, # middle row
                          @cells[:ca] == @cells[:cb] && @cells[:cb] == @cells[:cc] && @cells[:ca] != :nil, # bottom row
                          @cells[:aa] == @cells[:bb] && @cells[:bb] == @cells[:cc] && @cells[:aa] != :nil, # top left diag
                          @cells[:ac] == @cells[:bb] && @cells[:bb] == @cells[:ca] && @cells[:ac] != :nil, # top right diag
                          @cells[:aa] == @cells[:ba] && @cells[:ba] == @cells[:ca] && @cells[:aa] != :nil, # left col
                          @cells[:ab] == @cells[:bb] && @cells[:bb] == @cells[:cb] && @cells[:ab] != :nil, # middle col
                          @cells[:ac] == @cells[:bc] && @cells[:bc] == @cells[:cc] && @cells[:ac] != :nil] # right col
        win_conditions.any?
    end

    def player_choice (move = nil)
        # move = nil
        until @allowed_moves.include?(move.to_i)
            move = gets.chomp if move.nil?
            unless @allowed_moves.include?(move.to_i)
                print "Invalid move.  Please try again: "
                move = nil
            end
        end
        return move
    end

    def update_allowed_moves move
        @allowed_moves.slice!(@allowed_moves.index(move.to_i))
    end

    def update_board move
        @cells[@cell_map[move.to_i - 1]] = @player_one_turn ? :true : :false
    end

    def switch_turns
        if @player_one_turn
            @player_one_turn = false
        else
            @player_one_turn = true
        end
    end
end

game = TicTacToe.new