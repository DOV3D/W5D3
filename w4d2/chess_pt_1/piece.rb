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
        #iterate over all the positions a piece can move (info needed from subclass)
        #for each direction, collect all moves in that direction 
            #check if reaches the end of the board
            #check if the other side is present (capture them)
        #add to moves array 
        #return final array of all possible moves 

    #diagonals: [7,7], [0,0], [0, 7], [7, 0] 
    #horizontals: [7, x] or [0, x]
    #verticals: [x, 7] or [x, 0]
    #horizontal: first pos != 0  && second pos == 0

        positions = @@HORIZONTAL_DIRS + @@DIAGONAL_DIRS 
        valid = []
        positions.each do |coords|
            coords.each do |pos|  
                #if we are moving horizontally
                while pos[0] <= 7 || pos[0] >= 0
                    #move to right 
                    if pos[0] > 0 && pos[1] == 0
                        pos[0] += 1
                        valid << pos
                    #move to left 
                    elsif pos[0] < 0 && pos[1] == 0
                        pos[0] -= 1
                        valid << pos 
                    #move to vertically up 
                    elsif pos[0] == 0  && pos[1] > 0
                        pos[1] += 1
                        valid << pos
                    elsif pos[0] == 0  && pos[1] < 0
                        pos[1] -= 1
                        valid << pos
                    end 
                    

                end 



                    
                

                if pos[0] < 7 && pos[1] < 7 && pos[0] > -7 && pos[1] > -7
                    valid << pos  


        end 



    end 

    def mov_dirs 
    end 

    def grow_unblocked_moves_in_dir(dx, dy)
    end 
end 

class Rook < Piece

    def move_dirs

    end 

end 

class Bishop < Piece
end 

class Queen < Piece
end 

class Knight < Piece
end 

class King < Piece
end 

class Pawn < Piece
end 