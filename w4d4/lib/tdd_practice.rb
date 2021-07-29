require "set"

class Array 

    def my_uniq
        Set.new(self).to_a
    end 

    #require "byebug"
    def two_sum
        hash = {}
        #debugger
        result = []
        self.each_with_index do |x, idx|
            if hash.include?(x) 
                result << [hash[x], idx]
                hash[-x] = idx 
            else 
                hash[-x] = idx  
            end 
        end 
        result 

    end 

end 