#spec/calculator_spec.rb

require './lib/calculator.rb'

RSpec.describe Calculator do
    describe "#add" do
        it "returns the sum of two numbers" do
            calculator = Calculator.new
            expect(calculator.add(5, 2)).to eql(7)
        end

        it "returns the sum of more than two numbers" do
            calculator = Calculator.new
            expect(calculator.add(2,5,7)).to eql(14)
        end
    end

    describe "#subtract" do
        it "subtracts one number from another" do
            calculator = Calculator.new
            expect(calculator.subtract(10,6)).to eql(4)
        end
    end

    describe "#multiply" do
        it "multiplies two numbers together" do
            calculator = Calculator.new
            expect(calculator.multiply(2, 6)).to eql(12)
        end
    end

    describe "#divide" do
        it "divides one number by another" do
            calculator = Calculator.new
            expect(calculator.divide(24, 6)).to eql(4)
        end
    end
end