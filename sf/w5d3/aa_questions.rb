# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

# Example 1:

# Input: "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.
# Example 2:

# Input: "cbbd"
# Output: "bb"

def longest_palindrome(string)
  largest = ''
  (0...string.length).each do |i|
    (i + 1...string.length).each do |j|
      sub_str = string[i..j]
      if sub_str == sub_str.reverse
        if sub_str.length > largest.length
          largest = sub_str
        end
      end
    end
  end 
  largest
end

def longest_opt(string)
  largest = ''
  temp = ''
  (0...string.length).each do |i|
    temp += string[i]
    if temp == temp.reverse && temp.length > 1
      if temp.length > largest.length 
        largest = temp
        temp = ''
      end
    end
  end
  largest
end


p longest_opt('babad') #'bab'
p longest_opt('cbbd') #'bb'


