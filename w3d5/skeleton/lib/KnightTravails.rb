require_relative "00_tree_node.rb"

class KnightPathFinder

    attr_reader :root_node, :considered_positions

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [root_node]
    end 

    # Based on the pos argument
    # Returns an array of positions that would not be off-board (in a 8x8 grid)
    require "byebug"
    def self.valid_moves(current_node) # [3, 4]
        #debugger
        moves = [[2, 1], [2, -1], [-2, 1], [-2, -1],
                 [1, 2], [1, -2], [-1, 2], [-1, -2]]
        new_nodes = []
        # i = 0
        # while i < 8
        #     (1..2).each do |x|
                
        moves.each do |move|
            current_row = current_node.value[0]
            current_col = current_node.value[1]
            move_row = move[0]
            move_col = move[1]

            new_row = current_row + move_row
            new_col = current_col + move_col

            if new_row <= 7 && new_row >= 0 && new_col <= 7 && new_col >= 0
                new_node = PolyTreeNode.new([new_row, new_col])
                new_node.parent= (current_node)
                new_nodes << new_node
            end
        end
        

        new_nodes
        
    end 
    


    # new_move_positions
    # 1. Filters out positions that have already been visited (@considered_positions)
    # 2. Adds new moves to visited (@considered_positions)
    # 3. return new moves
    def new_move_positions(current_node)
        new_nodes = KnightPathFinder.valid_moves(current_node)

        new_nodes.select! { |node| !@considered_positions.include?(node) }
        
        new_nodes.each do |x|
            @considered_positions << x
        end

        new_nodes
    end 

    def build_move_tree(target) # [ [3, 3] ]
        queue = [root_node] # [ [3,3] ... [2,1] ]

        until queue.empty?
            node = queue.first # [3,3]
            if target == node.value # c and c's parent is b
                path = node.find_all_parents #c.find_all_parents
                return path
            else 
                new_nodes = new_move_positions(node) # [[1,2], [2,1], ...]
                queue += new_nodes
                queue.shift 
            end 
        end 
    end 

end

#my_knight = KnightPathFinder.new([3,4])
# current_node = PolyTreeNode.new([2,2])
# p KnightPathFinder.valid_moves(current_node)


# my_knight = KnightPathFinder.new([3,4])
# p my_knight.new_move_positions([3,4])
# p my_knight.considered_positions

my_knight = KnightPathFinder.new([0,0])
p my_knight.build_move_tree([7,7]) # => [Node[0,0], Node[2,1], Node[4,2]]
