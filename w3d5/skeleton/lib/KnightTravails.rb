require_relative "00_tree_node.rb"

class KnightPathFinder

    attr_reader :root_node, :considered_positions

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [root_node]
    end 

    # Based on the pos argument
    # Returns an array of positions that would not be off-board (in a 8x8 grid)
    def self.valid_moves(current_pos) # [3, 4]
        moves = [[2, 1], [2, -1], [-2, 1], [-2, -1],
                 [1, 2], [1, -2], [-1, 2], [-1, -2]]
        new_position = []
        # i = 0
        # while i < 8
        #     (1..2).each do |x|
                
        moves.each do |move|
            current_row = current_pos[0]
            current_col = current_pos[1]
            move_row = move[0]
            move_col = move[1]

            new_row = current_row + move_row
            new_col = current_col + move_col

            if new_row <= 7 && new_row >= 0 && new_col <= 7 && new_col >= 0
                new_position << [new_row, new_col]
            end
        end

        new_position
        
    end 


    # new_move_positions
    # 1. Filters out positions that have already been visited (@considered_positions)
    # 2. Adds new moves to visited (@considered_positions)
    # 3. return new moves
    def new_move_positions(current_pos)
        new_positions = KnightPathFinder.valid_moves(current_pos)

        new_positions.select! { |pos| !@considered_positions.include?(pos) }
        
        new_positions.each do |x|
            new_knight = PolyTreeNode.new(x)
            @considered_positions << new_knight
        end

        new_positions
    end 

end 

my_knight = KnightPathFinder.new([3,4])
p my_knight.new_move_positions([3,4])
p my_knight.considered_positions