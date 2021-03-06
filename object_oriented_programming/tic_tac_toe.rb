class TicTacToe

    def initialize

        # player one will start
        @player_one_turn = true

        # initialize the game cells
        @cell_map = [:aa, :ab, :ac, :ba, :bb, :bc, :ca, :cb, :cc]

        @cell_translation = {true: "X", false: "O"}

        @cells = {
            aa: " ",
            ab: " ",
            ac: " ",
            ba: " ",
            bb: " ",
            bc: " ",
            ca: " ",
            cb: " ",
            cc: " "
        }

        # initialize the permitted moveset
        @allowed_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]

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

        # define win conditions
        win_conditions = [@cells[:aa] == @cells[:ab] && @cells[:ab] == @cells[:ac] && @cells[:aa],
                          @cells[:ba] == @cells[:bb] && @cells[:bb] == @cells[:bc] && @cells[:ba],
                          @cells[:ca] == @cells[:cb] && @cells[:cb] == @cells[:cc] && @cells[:ca],
                          @cells[:aa] == @cells[:bb] && @cells[:bb] == @cells[:cc] && @cells[:aa],
                          @cells[:ac] == @cells[:bb] && @cells[:bb] == @cells[:ca] && @cells[:ac],
                          @cells[:aa] == @cells[:ba] && @cells[:ba] == @cells[:ca] && @cells[:aa],
                          @cells[:ab] == @cells[:bb] && @cells[:bb] == @cells[:cb] && @cells[:ab],
                          @cells[:ac] == @cells[:bc] && @cells[:bc] == @cells[:cc] && @cells[:ac]]
        win_conditions.any?
    end

    def player_choice
        move = nil
        until @allowed_moves.include?(move.to_i)
            move = gets.chomp
            unless @allowed_moves.include?(move.to_i)
                print "Invalid move.  Please try again: "
            end
        end
        return move
    end

    def update_allowed_moves move
        @allowed_moves.slice!(@allowed_moves.index(move.to_i))
    end

    def update_board move
        @cells[@cell_map[move.to_i - 1]] = @player_one_turn ? true : false
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