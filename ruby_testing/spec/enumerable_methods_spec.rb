# spec/enumerable_methods.rb

require "./lib/enumerable_methods.rb"

# RSpec.describe "#my_each" do
#     it "prints all items in an array" do
#     end
# end

# RSpec.describe "#my_each_with_index" do
#     it "" do
#     end
# end

RSpec.describe "#my_select" do
    it "selects only true values" do
        array = [true, false, true, true, false]
        expect(array.my_select { |item| item }).to eql([true, true, true])
    end

    it "selects only values greater than 5" do
        array = [5, 2, 10, 11, 6, 3, 7, 4]
        expect(array.my_select { |item| item > 5 }).to eql([10, 11, 6, 7])
    end

    it "selects only values divisible by 3" do
        array = [4, 3, 6, 7, 1, 9]
        expect(array.my_select { |item| item % 3 == 0 }).to eql([3, 6, 9])
    end
end

RSpec.describe "#my_all?" do
    it "returns \'true\' if all items are true" do
        array = [true, true, true, true]
        expect(array.my_all? { |item| item }).to eql(true)
    end

    it "returns \'false\' if any items are false" do
        array = [true, true, false, true]
        expect(array.my_all? { |item| item }).to eql(false)
    end

    it "returns true if all items are greater than 7" do
        array = [8, 10, 23, 17, 14]
        expect(array.my_all? { |item| item > 7 }).to eql(true)
    end

    it "returns true if all items are integers" do
        array = [5, 1, 7, 3, 9]
        expect(array.my_all? { |item| item.integer? }).to eql(true)
    end
end

RSpec.describe "#my_any?" do
    it "returns \'true\' if any items are true" do
        array = [false, false, true, false]
        expect(array.my_any? { |item| item }).to eql(true)
    end

    it "returns \'false\' if no items are true" do
        array = [false, false, false, false]
        expect(array.my_any? { |item| item }).to eql(false)
    end

    it "returns \'true\' if any items are greater than 17" do
        array = [16, 18, 20, 12]
        expect(array.my_any? { |item| item > 17 }).to eql(true)
    end

    it "returns \'true\' if any items are integers" do
        array = ["String", [1, 4], 5, {}]
        expect(array.my_any? { |item| item.class == Integer }).to eql(true)
    end
end

RSpec.describe "#my_none?" do
    it "returns \'true\' if no items are true" do
        array = [false, false, false, false]
        expect(array.my_none? { |item| item }).to eql(true)
    end

    it "returns \'false\' if any items are true" do
        array = [false, false, true, false]
        expect(array.my_none? { |item| item }).to eql(false)
    end

    it "returns \'true\' if no items are positive" do
        array = [-1, -6, -16, -4]
        expect(array.my_none? { |item| item >= 0 }).to eql(true)
    end
end

RSpec.describe "#my_count" do
    it "counts the number of items in the array" do
        array = [1, 6, 3, 8, 6]
        expect(array.my_count { |item| true }).to eql(5)
    end

    it "counts the number of integers in the array" do
        array = ["String", 5, [], 8, {}]
        expect(array.my_count { |item| item.class == Integer }).to eql(2)
    end

    it "counts the number of items are greater than 5" do
        array = [4, 8, 3, 6, 9]
        expect(array.my_count { |item| item > 5 }).to eql(3)
    end
end

RSpec.describe "#my_map" do
    it "multiplies all items by 3" do
        array = [5, 3, 8, 7, 2]
        expect(array.my_map { |item| item * 3 }).to eql([15, 9, 24, 21, 6])
    end

    it "appends \'_copy\' to every string in the array" do
        array = ["String", "Photo", "Letter"]
        expect(array.my_map { |item| item + "_copy" }).to eql(["String_copy", "Photo_copy", "Letter_copy"])
    end
end

RSpec.describe "#my_inject" do
    it "sums the items in the array" do
        array = [1, 2, 3, 4, 5]
        expect(array.my_inject { |sum, item| sum += item }).to eql(15)
    end

    it "concatenates all the strings together" do
        array = ["What's", " up", ", chicken", " butt?"]
        expect(array.my_inject { |phrase, item| phrase += item }).to eql("What's up, chicken butt?")
    end
end