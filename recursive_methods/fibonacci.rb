def fibs n
    first, second, result = 0, 1, []
    n.times do
        result << first + second
        first, second = second, first + second
    end
    puts result.join(", ")
end

def fibs_rec n, sequence = [0, 1, 1], printed = []
    if n <= 1
        # print n
        return n
    else
        result = fibs_rec(n-2, sequence, printed) + fibs_rec(n-1, sequence, printed)
        unless sequence.include? result
            sequence.push result
            sequence.each do |item|
                unless printed.include? item
                    print item.to_s + ", "
                    printed.push item
                end
            end
            return result
        end  
        result   
    end

end