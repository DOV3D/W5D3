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

def second_anagram?(str1, str2)
    
    str2_chars = str2.split("")
    count = 0
    str1.each_char do |char|
        idx = str2_chars.index(char)
        if idx != nil
            str2_chars.delete_at(idx)
            count += 1
        end 
    end 
    count == str1.length && str2_chars.empty? 
 

end 
#O(n) time complexity 
#as strings get longer, more permutations needed in first method 

p second_anagram?("gizmo", "sally")
p second_anagram?("elvis", "lives")