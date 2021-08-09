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

p palindrome_integer(121)
p palindrome_integer(-121)
p palindrome_integer(10)
p palindrome_integer(-101)

