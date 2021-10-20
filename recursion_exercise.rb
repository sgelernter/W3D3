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

