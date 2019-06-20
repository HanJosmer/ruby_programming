def factorial n
    return 1 if n == 1
    factorial(n-1) * n
end

def palindrome str
    str = str.split("") if str.class == String
    if str.length == 1
        return true
    elsif str.length == 2
        return str[0] == str[1] ? true : false
    else
        return false unless str.shift == str.pop
        palindrome str
    end
end

def bottles_of_beer n
    return puts "No more bottles of beer on the wall" if n == 0
    puts "#{n} #{n == 1 ? "bottle" : "bottles"} of beer on the wall"
    bottles_of_beer(n-1)
end

def fibonacci n 
    return 0 if n == 0
    return 1 if n == 1
    fibonacci(n-2) + fibonacci(n-1)
end

def flatten(array, result = [])
    array.each do |element|
      if element.kind_of?(Array)
        flatten(element, result)
      else
        result << element
      end
    end 
    result
  end

  roman_mapping = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }
  def i_to_r i, str = ""
    if i < 1
        return str
    elsif i < 4
        return i_to_r(i - 1, str + "I")
    elsif i < 5
        return i_to_r(i - 4, str + "IV")
    elsif i < 9
        return i_to_r(i - 5, str + "V")
    elsif i < 10
        return i_to_r(i - 9, str + "IX")
    elsif i < 40
        return i_to_r(i - 10, str + "X")
    elsif i < 50
        return i_to_r(i - 40, str + "XL")
    elsif i < 90
        return i_to_r(i - 50, str + "L")
    elsif i < 100
        return i_to_r(i - 90, str + "XC")
    elsif i < 400
        return i_to_r(i - 100, str + "C")
    elsif i < 500
        return i_to_r(i - 400, str + "CD")
    elsif i < 900
        return i_to_r(i - 500, str + "D")
    elsif i < 1000
        return i_to_r(i - 900, str + "CM")
    else
        return i_to_r(i - 1000, str + "M")
    end
end

    # if i == 0
    #     return str
    # elsif i == 1
    #     return i_to_r(i - 1, str + "I")
    # elsif i == 4
    #     return i_to_r(i - 4, str + "IV")
    # elsif i == 5
    #     return i_to_r(i - 5, str + "v")
    # elsif i == 9 