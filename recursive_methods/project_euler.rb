def multiples n, sum=0
    n -= 1
    sum += n if n % 3 == 0 || n % 5 == 0
    return n > 0 ? multiples(n, sum) : sum
end

def even_fib fib=[], n=0, sum=0
    new_fib = fib.fetch(n-2, 0) + fib.fetch(n-1, 1)
    return sum if new_fib > 4000000
    sum += new_fib if new_fib % 2 == 0
    even_fib(fib.push(new_fib), n+1, sum)
end

def largest_prime n, i=n, factors=[]
    if i < 1
        primes = factors.select do |factor|
            factors_of_factor = (1..factor).select do |i|
                factor % i == 0
            end
            factors_of_factor.size == 2 ? true : false
        end
        return primes.max
    end
    factors.push(i) if n % i == 0
    largest_prime(n, i-1, factors)
end

# def largest_palindrome a=999, b=999, palindromes=[]
#     if (a * b).to_s == (a * b).to_s.reverse
#         palindromes.push(a * b)
#         largest_palindrome(a, b-1, palindromes)
#     elsif a != 1 && b == 1
#         return largest_palindrome(a-1, 999, palindromes)
#     elsif a == 1 && b == 1
#         return palindromes.max
#     else
#         largest_palindrome(a, b-1, palindromes)
#     end
# end

def smallest_multiple n, i=1, multiple=1
    return multiple if i > n
    incrementer = multiple
    multiple += incrementer until multiple % i == 0
    smallest_multiple(n, i+1, multiple)
end