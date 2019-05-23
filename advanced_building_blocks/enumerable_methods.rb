module Enumerable
    def my_each
        self.length.times do |index|
            item = self[index]
            yield(item)
        end
    end

    def my_each_with_index
        self.length.times do |index|
            item = self[index]
            yield(item, index)
        end
    end

    def my_select
        return_array = Array.new
        self.my_each do |item|
            if yield(item)
                return_array.push(item)
            end
        end
        return_array

        # return_array = Array.new
        # self.length.times do |index|
        #     item = self[index]
        #     if yield(item)
        #         return_array.push(item)
        #     end
        # end
        # return_array 
    end

    def my_all?
        self.my_each do |item|
            unless yield(item)
                return false
            end
        end
        true
    end

    def my_any?
        self.my_each do |item|
            if yield(item)
                return true
            end
        end
        false
    end

    def my_none?
        self.my_each do |item|
            if yield(item)
                return false
            end
        end
        true
    end

    def my_count
        return_array = self.my_select do |item|
            yield(item)
        end
        return_array.length
    end

    # def my_map
    #     return_array = Array.new
    #     self.my_each do |item|
    #         return_array.push(yield(item))
    #     end
    #     return_array
    # end

    # def my_map proc
    #     return_array = Array.new
    #     self.my_each do |item|
    #         return_array.push(proc.call(item))
    #     end
    #     return_array
    # end

    def my_map(proc=nil)
        return_array = Array.new
        self.my_each do |item|
            return_array.push(proc.call(item)) unless proc.nil?
            return_array.push(yield(item)) if block_given? && proc.nil?
        end
        return_array
    end

    def my_inject
        memo = self[0]
        self.my_each_with_index do |item, index|
            next if index == 0
            memo = yield(memo, item)
        end
        return memo
    end
end

def multiply_els array
    array.my_inject { |product, el| product * el }
end