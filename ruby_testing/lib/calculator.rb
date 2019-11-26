class Calculator
    
    def add(*args)
        sum = args.inject { |sum, arg| sum += arg }
    end

    def subtract(a, b)
        a - b
    end

    def multiply(a, b)
        a * b
    end

    def divide(a, b)
        a / b
    end
end