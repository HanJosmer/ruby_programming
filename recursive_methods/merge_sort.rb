def merge_sort arr
    if arr.length == 1
        return arr
    elsif arr.length == 2
        return arr[0] < arr[1] ? arr : arr.reverse
    else
        first_arr, second_arr = merge_sort(arr.take(arr.length / 2)), merge_sort(arr.drop(arr.length / 2))
        result = []
        until first_arr.empty? && second_arr.empty?
            result.push(first_arr.fetch(0, Float::INFINITY) < second_arr.fetch(0, Float::INFINITY) ? first_arr.shift : second_arr.shift)
        end
        return result
    end
end

p merge_sort [8, 7, 6, 5, 4, 3, 2, 1]