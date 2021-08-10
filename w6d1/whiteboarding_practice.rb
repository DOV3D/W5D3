# Given an integer x, return true if x is palindrome integer.

# An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.

 

# Example 1:

# Input: x = 121
# Output: true
# Example 2:

# Input: x = -121
# Output: false
# Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
# Example 3:

# Input: x = 10
# Output: false
# Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
# Example 4:

# Input: x = -101
# Output: false

#takes in an number
#check if it's > 0 
#convert this number to a string 
#check if the number = number.reversed 
#return boolean 

def palindrome_integer(num)
    if num > 0 
        str_num = num.to_s
        return true if str_num == str_num.reverse
    end 
    false 
    
end

# p palindrome_integer(121)
# p palindrome_integer(-121)
# p palindrome_integer(10)
# p palindrome_integer(-101)

# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

 

# Example 1:

# Input: strs = ["flower","flow","flight"]
# Output: "fl"
# Example 2:

# Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.

#arr[0]
# flower = flow
#             temp = ""
# (0..str2.length).each do |i|
#     break

# Input: strs = ["flower","flow","flight"]

def longest_common(array)
    ans = ""
    str_1 = array.shift

    array.each do |str|
        temp = ""
        (0...str_1.length).each do |idx|
            if str_1[idx] == str[idx]
                temp += str_1[idx]
                break if temp.length > ans.length
            else 
                break
            end
        end
        if ans.empty?
            ans = temp
        elsif ans.length > temp.length
            ans = temp
        end
    end
    ans
end 

# strs = ["flower","flow","flight"]
# strs = ["dog","racecar","car"]

p longest_common(strs)

#set first element 
#pass next element through bsearch 
# 

