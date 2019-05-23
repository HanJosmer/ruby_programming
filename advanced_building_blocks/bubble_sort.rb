def bubble_sort(array)
    i = 0
    while i < (array.length - 1)
        left = array[i] 
        right = array[i+1]
        if left > right
            swap_items(array, i, i+1)
            i = 0
            redo
        end
        i += 1
    end
    return array
end


def swap_items(array, left, right)
    temp = array.slice!(left)
    array.insert(right, temp)
end

array = [4, 3, 78, 2, 0, 2]
print "#{bubble_sort(array)}\n"