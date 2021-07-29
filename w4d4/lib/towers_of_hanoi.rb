class TowersofHanoi

    attr_reader :left, :mid, :right

    def initialize 
        @left = (1..6).to_a 
        @mid = []
        @right = []

    end 

    def to_s 
        system("clear")
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