# spec/tic_tac_toe_spec.rb

require "./lib/tic_tac_toe.rb"

RSpec.describe TicTacToe do
    
    describe "#player_choice" do
        context "with valid input" do
            it "returns player-selected move" do
                game = TicTacToe.new
                expect(game.player_choice(5)).to equal(5)
            end
        end
        # context "with invalid input" do
        #     it "outputs an error to console" do
        #         game = TicTacToe.new
        #         expect(game.player_choice(150)).to output("Invalid move.  Please try again: ").to_stdout
        #     end
        #     after(:example) do
        #         puts 5
        #     end
        # end
    end

    describe "#update_allowed_moves" do
        it "removes player-selected move from move pool" do
            game = TicTacToe.new
            game.update_allowed_moves(5)
            expect(game.allowed_moves).to eq([1, 2, 3, 4, 6, 7, 8, 9])
        end
    end

    describe "#switch_turns" do
        context "currently player one's turn" do
            it "switches from player one's turn to player two's turn" do
                game = TicTacToe.new
                game.player_one_turn = true
                expect(game.switch_turns).to eq(false)
            end
        end
        context "currently player two's turn" do
            it "switches from player two's turn to player one's turn" do
                game = TicTacToe.new
                game.player_one_turn = false
                expect(game.switch_turns).to eq(true)
            end
        end
    end
end