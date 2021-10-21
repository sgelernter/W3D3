require "byebug"

def rec_range(start, last)
    return [] if last < start
    return [last] if start == last 
    [start] + range(start + 1, last)
end

def iter_range(start, last)
    array_new = []
    (start..last).each { |num| array_new << num }
    array_new
end

def exp_1(num, exp)
    return 1 if exp == 0
    num * exp_1(num, exp - 1)
end

# p exp_1(2, 2)
# p exp_1(2, 3)
# p exp_1(3, 3)
# p exp_1(10, 0)

def exp_2(num, exp)
    return 1 if exp == 0
    return num if exp == 1
    if exp.even?
        exp_2(num, exp/2)**2
    else
        num * (exp_2(num, (exp - 1)/ 2)**2)
    end
end

# p exp_2(2, 2)
# p exp_2(2, 3)
# p exp_2(3, 3)
# p exp_2(10, 0)


def deep_dup(arr)
    return arr.dup if arr.none? {|ele| ele.is_a?(Array)}
    
    arr.map do |ele|
        if ele.is_a?(Array) && ele.any? {|subele| subele.is_a?(Array)}
            deep_dup(ele)
        elsif !ele.is_a?(Array)
            ele
        else
            ele.dup
        end
    end
end

def iter_fib(n)
    new_array = [0, 1]
    return new_array[0...n] if n < 3
    while new_array.length < n
        new_array << (new_array[-1] + new_array[-2])
    end
    new_array
end

def rec_fib(n)
    return [0] if n == 1
    return [0, 1] if n == 2 
    fib_array = rec_fib(n - 1) 
    fib_array << fib_array[-2..-1].sum
end

def bsearch(array, target)
    middle = array.length / 2
    check_element = array[middle]   
    # return nil if !array.include?(target)
    return nil if array.first != target && array.length == 1
    return middle if check_element == target
    if check_element > target
        bsearch(array[0...middle], target) 
    else
        begin
            array[0..middle].length + bsearch(array[middle + 1..-1], target)
        rescue
            return nil
        end
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    return array if array.length == 0 || array.length == 1

    middle = array.length / 2

    merge(merge_sort(array[0...middle]), merge_sort(array[middle..-1]))

end

def merge(array1, array2)
    merge = []

    if array1.length <= array2.length
        shorter = array1
        longer = array2
    else
        shorter = array2
        longer = array1
    end

    (0...shorter.length).each do |i|
        if array1[i] <= array2[i]
            merge.push(array1[i], array2[i])
        else
            merge.push(array2[i], array1[i])
        end
    end 

    if array1.length != array2.length
        merge.push(longer.last)
        if merge[-1] < merge[-2]
            merge[-1], merge[-2] = merge[-2], merge[-1]
        end
        merge
    else
        merge
    end

end

# # p merge([9], [1, 3])
# # p merge_sort([4, 3, 1])
# p merge_sort([4, 2, 3, 1, 8])
# # p merge_sort([4, 2, 3, 1, 7, 9, 2, 5, 8, 5, 7, 2])
# # p merge_sort([4, 2, 3, 1, 7, 9, 2, 5, 8, 5, 7, 2, 9, 3, 4, 8])

def subsets(arr)
    return [[]] if arr.length == 0
    return [[], [1]] if arr.length == 1

    all_previous_sets = subsets(arr[0...-1])
    
    plus_last = all_previous_sets.map {|subArr| subArr + [arr[-1]] }
    all_previous_sets + plus_last
    
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]