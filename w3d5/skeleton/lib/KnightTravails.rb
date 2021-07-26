class KnightPathFinder

    attr_reader :root_node

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [root_node] 


    end 

    def self.valid_moves(pos)
        #moves = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
        @considered_positions << pos
    end 

    def new_move_positions(pos)
        KnightPathFinder.valid_moves(pos)
        


    end 

end 