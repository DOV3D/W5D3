# def bad_two_sum?(array, target)
#     (0...array.length).each do |idx|
#         (idx+1...array.length).each do |idx2|
#             if array[idx] + array[idx2] == target
#                 return true 
#             end 
#         end 
#     end 
#     false 

# end 

#O(n^2)
#space --> 1 
# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(array, target)
    array = array.sort

    return nil if array.empty?
    
    
    left = array[0]
    right = array[-1]

    return true if mid == sum

    

    
end 

# arr = [0, 1, 5, 7]
# [0, 1] [5, 7]
# [0] [1] [5] [7]
# [0, 1] [5, 7]
# [0, 1, 5, 7] [7]



# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def hash_map(array, target)
    hash = {}

    (0...array.length).each do |ele|


    end 


end 
