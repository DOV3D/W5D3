#Phase 1 
require "byebug"


def my_min(array)

    lowest = 0
    max_lowest = 0
    (0...array.length).each do |idx1|
        (0...array.length).each do |idx2|
            if array[idx1] < array[idx2]
                lowest = array[idx1]
            end 
        end
        if lowest < max_lowest 
            max_lowest = lowest  
        end 
    end  
    max_lowest

end 


# Phase 2

def my_min(array)
    lowest = 0
   (0...array.length).each do |idx1|
        if array[idx1] < lowest
            lowest = array[idx1]
        end 
    end 
    lowest
end 
#time complexity: O(n)

# p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])


# Phase 1
# O(n^2) (quadratic)

def largest_contiguous_subsum(array)
    new_arr = []
    (0...array.length).each do |idx1|
        sum = [array[idx1]]
        new_arr << sum
        (idx1+1...array.length).each do |idx2|
            sum += [array[idx2]]
            new_arr << sum
        end
    end

    sums = []
    new_arr.each do |pair|
        sums << pair.sum
    end

    sums.max
end


# phase 2

def largest_contiguous_subsum(array)
    largest = array.first   # 5
    current = 0

    (0...array.length).each do |i|
        if current < 0 
            current = 0
        end
        current += array[i]   # 5 + 3

        if current > largest   # 8 > 5
            largest = current  #  8
        end
    end

    largest

end

# p largest_contiguous_subsum([5, 3, -7]) #--> 8
# p largest_contiguous_subsum([2, 3, -6, 7, -6, 7]) # --> 8
# p largest_contiguous_subsum([-5, -1, -3]) # --> -1
# p largest_contiguous_subsum([ ])