def fibs n
    first, second, result = 0, 1, []
    n.times do
        result << first + second
        first, second = second, first + second
    end
    puts result.join(", ")
end

def fibs_rec n
    return 0 if n == 0
    return 1 if n == 1
    return fibs_rec(n-2) + fibs_rec(n-1)
end