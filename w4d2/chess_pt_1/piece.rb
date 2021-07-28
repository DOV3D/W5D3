class Piece
    attr_accessor :pos, :color
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def inspect 
       "Piece: #{@color}"
    end


end

# Each position in the board either holds a moving Piece or a NullPiece (NullPiece will inherit from Piece).

# There are many different kinds of pieces in chess, and each moves a specific way. 
# Based on their moves, they can be placed in four categories:

# Sliding pieces (Bishop/Rook/Queen)
# Stepping pieces (Knight/King)
# Null pieces (occupy the 'empty' spaces)
# Pawns (we'll do this class last)
# To start off, you'll want to create an empty Piece class as a placeholder for now. 
# Write code for #initialize so we can setup the board with instances of Piece in locations where a 
# Queen/Rook/Knight/ etc. will start and nil where the NullPiece will start.

class NullPiece < Piece

    def initialize(color, board, pos)
        super(color, board, pos)
    
    end 

    def symbol
        symbol = "N"
    end 

end 

module Stepable 
    def moves 

    end

    def move_diffs
    end 

end 

module Slideable 
    @@HORIZONTAL_DIRS = [[-1,0], [1, 0], [0, -1], [0, 1]]
    @@DIAGONAL_DIRS = [[1, -1], [1, 1], [-1, -1], [-1, 1]]

    

    def horizontal_dirs
        @@HORIZONTAL_DIRS
    end 

    def diagonal_dirs
        @@DIAGONAL_DIRS
    end 

    def moves
        #Used by bishop, queen, rook   
        #array that collects the moves 
        arr = []
        #iterate over all the positions a piece can move (info needed from subclass)
        move_dirs.each do |pos|
            #add to moves array 
            arr += grow_unblocked_moves_in_dir(pos)
        end
        #return final array of all possible moves 
        arr
    end 

    def mov_dirs 
    end 

    def grow_unblocked_moves_in_dir(dx, dy)
        # condition for loop breaking
        arr = []
        x_pos = self.pos[0]
        y_pos = self.pos[1]
        #for each direction, collect all moves in that direction 
        #check if reaches the end of the board
        until x_pos == 0 || y_pos == 0 || x_pos == 7 || y_pos == 7 || board.rows[x_pos, y_pos].color == self.color
            # Add a position
            x_pos += dx
            y_pos += dy
            arr << [x_pos, y_pos]
            #check if the other side is present (capture them)  
            break if board.rows[x_pos, y_pos].color != self.color
        end
        arr
    end
    
    
end 

class Rook < Piece
    def initialize
        super
    end

    def symbol
        # add in rook symbol
    end

    private
    def move_dirs
        horizontal_dirs
    end
end 

class Bishop < Piece
    def initialize
        super
    end

    def symbol
        # add in bishop symbol
    end

    private
    def move_dirs
        diagonal_dirs
    end
end 

class Queen < Piece
    def initialize
        super
    end

    def symbol
        # add in queen symbol
    end

    private
    def move_dirs
        horizontal_dirs 
        diagonal_dirs
    end
end 

class Knight < Piece
end 

class King < Piece
end 

class Pawn < Piece
end 