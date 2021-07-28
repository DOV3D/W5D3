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
    @@HORIZONTAL_DIRS = []
    @@DIAGONAL_DIRS = []

    def horizontal_dirs
    end 

    def diagonal_dirs
    end 

    def moves
    end 

    def mov_dirs 
    end 

    def grow_unblocked_moves_in_dir(dx, dy)
    end 
end 

class Rook < Piece

end 

class Bishop < Piece
end 

class Queen < Piece
end 

class Knight < Piece
end 

class King < Piece
end 

class Pawn < piece
end 