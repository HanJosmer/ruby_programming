# spec/caesar_spec.rb

require "./lib/caesar.rb"

RSpec.describe "#caesar_cipher" do
    it "shifts one character" do
        expect(caesar_cipher("a", 1)).to eql("b")
    end

    it "shifts multiple characters" do
        expect(caesar_cipher("apple", 5)).to eql("fuuqj")
    end

    it "shifts uppercase characters" do
        expect(caesar_cipher("HELLO", 10)).to eql("ROVVY")
    end

    it "shifts a mixture of upper- and lowercase characters" do
        expect(caesar_cipher("PhD", 7)).to eql("WoK")
    end

    it "ignores spaces between words" do
        expect(caesar_cipher("Hello World", 2)).to eql("Jgnnq Yqtnf")
    end

    it "ignores punctuation" do
        expect(caesar_cipher("Howdy, partner!", 4)).to eql("Lsahc, tevxriv!")
    end

    it "accepts shifts greater than 26 (cycles the alphabet)" do
        expect(caesar_cipher("friend", 27)).to eql("gsjfoe")
    end

    it "will not accept non-integer shifts" do
        expect(caesar_cipher("example", 2.5)).to eql("Shift value is not an integer")
    end
end