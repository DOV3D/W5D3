# phase 1
# def first_anagram? (str1, str2)
#     str1_chars = str1.split("").permutation(str1.length).to_a
   
#     str1_chars.each do |word|
#         if str2 == word.join("")
#             return true
#         end 
#     end 
#     false 

# end 
# #0(n!) time complexity 

# p first_anagram?("gizmo", "sally")    #=> false 
# p first_anagram?("elvis", "lives")    #=> true

# phase 2
# def second_anagram?(str1, str2)
    
#     str2_chars = str2.split("")
#     count = 0
#     str1.each_char do |char|
#         idx = str2_chars.index(char)
#         if idx != nil
#             str2_chars.delete_at(idx)
#             count += 1
#         end 
#     end 
#     count == str1.length && str2_chars.empty? 
 

# end 
#O(n) time complexity 
#as strings get longer, more permutations needed in first method 

# p second_anagram?("gizmo", "sally")
# p second_anagram?("elvis", "lives")


# phase 3

# def third_anagram?(str1, str2) 
#     str1.chars.sort! == str2.chars.sort!
# end

# # O(n log n) 

# p third_anagram?("gizmo", "sally")
# p third_anagram?("elvis", "lives")



# phase 4

def fourth_anagram?(str1, str2)
    # hash1 = Hash.new(0)
    # hash2 = Hash.new(0)

    # str1.each_char do |char| 
    #     hash1[char] += 1
    # end
    # str2.each_char do |char| 
    #     hash2[char] += 1
    # end
    # hash1 == hash2

    hash1 = Hash.new(0)

    str1.each_char do |char| 
        hash1[char] += 1
    end
    str2.each_char do |char|
        return false if !hash1.has_key?(char)
    end

    true
end

 # O(n^2)
 
p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")

