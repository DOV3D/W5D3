class TowersofHanoi

    attr_reader :left, :mid, :right

    def initialize
        @left = (1..6).to_a 
        @mid = Array.new(6){" "}
        @right = Array.new(6){" "}
    end 

    def win?
        if @right == (1..6).to_a && @mid.empty? && @left.empty?
            puts "Nice job!"
            return true
        end
        false
    end

    def get_input
        puts "Enter the start pile and end pile location like 'left, right'"
        begin
            input = gets.chomp.split(", ")
        rescue !["left", "right", "mid"].include?(input)
            puts "That is not a valid input"
        end
        return input
    end

    def play_turn
        while !win?
            puts self
            from, to = get_input
            place_disc(from, to)
        end
    end

    def place_disc(from, to)
        hash = {"left" => @left, "mid" => @mid, "right" => @right}
        hash[to].unshift(hash[from].shift)
    end


    def to_s 
        #system("clear")
        rows = @left.zip(mid, right)
        rows.each do |left, mid, right|
            print "#{left}".center(10, " ")
            print "#{mid}".center(10, " ")
            puts "#{right}".center(10, " ")

        end 
        print "left".center(10, " ")
        print "mid".center(10, " ")
        puts "right".center(10, " ")
    end 



end 