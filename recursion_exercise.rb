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