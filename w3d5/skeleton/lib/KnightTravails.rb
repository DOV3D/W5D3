require_relative "00_tree_node.rb"

class KnightPathFinder

    attr_reader :root_node, :considered_positions

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end 

    # Based on the pos argument
    # Returns an array of positions that would not be off-board (in a 8x8 grid)
    require "byebug"
    def self.valid_moves(current_position) # [3, 4]
        #debugger
        moves = [[2, 1], [2, -1], [-2, 1], [-2, -1],
                 [1, 2], [1, -2], [-1, 2], [-1, -2]]

        new_positions = []
                
        moves.each do |move|
            current_row = current_position[0]
            current_col = current_position[1]
            move_row = move[0]
            move_col = move[1]

            new_row = current_row + move_row
            new_col = current_col + move_col

            if new_row <= 7 && new_row >= 0 && new_col <= 7 && new_col >= 0
                new_position = [new_row, new_col]
                new_positions << new_position
            end
        end

        new_positions
    end 
    


    # new_move_positions
    # 1. Filters out positions that have already been visited (@considered_positions)
    # 2. Adds new moves to visited (@considered_positions)
    # 3. return new moves
    def new_move_positions(current_position)
        new_positions = KnightPathFinder.valid_moves(current_position)

        new_positions.select! { |position| !@considered_positions.include?(position) }
        
        new_positions.each do |position|
            @considered_positions << position
        end

        new_positions
    end 

    def build_move_tree
        queue_of_nodes = [root_node]

        until queue_of_nodes.empty?
            first_node = queue_of_nodes.first

            new_positions = self.new_move_positions(first_node.value)
            
            new_positions.each do |position|
                new_node = PolyTreeNode.new(position)
                new_node.parent = first_node
                queue_of_nodes << new_node
                queue_of_nodes.shift
            end
        end
    end 

    def find_path
        self.build_move_tree
    end

end

my_knight = KnightPathFinder.new([0,0])

my_knight.build_move_tree