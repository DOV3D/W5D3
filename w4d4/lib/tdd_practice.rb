require "set"

class Array
    def uniq
        Set.new(self).to_a
    end

    def two_sum
        result = []
        seen = {}
        self.each.with_index do |val, i|
            result << [seen[val], i] if seen.include?(val)
            seen[-val] = i
        end
        result.sort
    end

    def my_transpose
        return [] if self.empty?
        self[0].zip(*self[1..-1])
    end

end


def profit(array)
    diff = []
    (0...array.length).each do |idx|
        (idx...array.length).each do |idx2|
            diff << array[idx] - array[idx2]
        end
        
    end
    array.max
end
