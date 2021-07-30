#Phase 1 



def my_min(array)

    lowest = 0
    max_lowest = 0
    (0...array.length).each do |idx1|
        (0...array.length).each do |idx2|
            if array [idx1] < array[idx2]
                lowest = array[idx1]
            end 
        end
        if lowest < max_lowest 
            max_lowest = lowest  
        end 
    end  
    max_lowest

end 


Phase 2

def my_min(array)
    lowest = 0
   (0...array.length).each do |idx1|
        if array[idx1] < lowest
            lowest = array[idx1]
        end 
    end 
    lowest

    #array.inject {|acc, ele| acc = ele if ele < acc}
  
end 
#time complexity: O(n)

p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])