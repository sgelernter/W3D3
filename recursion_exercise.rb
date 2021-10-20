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
    
    # remainder = deep_dup(arr[1..-1])

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

            

    # if arr.first.is_a?(Array)
    #     deep_dup(arr[0]) + deep_dup(remainder)
    # else
    #     arr[0].dup + deep_dup(remainder)
    # end

end

robot_parts = [
    ["nuts", "bolts", "washers"],
    ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = deep_dup(robot_parts)
# arr1 = [1, [2], [3, [4]]]
# arr2 = deep_dup([1, [2], [3, [4]]])
# sam = [1, [2, 3]]
# sam2 = deep_dup(sam)