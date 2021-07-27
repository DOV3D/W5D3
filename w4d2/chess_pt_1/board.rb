
class Board
    attr_reader :board, :nullPiece

    def initialize
        @board = Array.new(8) {Array.new(8)}

        #set middle squares to null pieces  
        (2...@board.length - 2).each do |rows|
            (0...@rows.length).each do |squares|
                null_piece = NullPiece.new(nil, @board, [rows, squares])
                @board[rows][squares] = null_piece 
            end 
        end 

        #set first two rows to black pieces 
        (0...2).each do |rows|
            (0...@rows.length).each do |squares|
                piece = Piece.new("black", @board, [rows, squares])
                @board[rows][squares] = piece
            end 
        end 
        
        #set last two rows to white pieces 
        (6...8).each do |rows|
            (0...@rows.length).each do |squares|
                piece = Piece.new("white", @board, [rows, squares])
                @board[rows][squares] = piece
            end 
        end 

    end

    def [](pos)
        @board[pos]
    end

    def []=(pos, value)
        @board[pos] = value
    end

    # Update board with th
    def move_piece(start_pos, end_pos, color)
        if !@board[start_pos].nil? && @board[end_pos].nil?
            @board[start_pos] = nil
            @board[end_pos] = the_piece.pos
            # Piece no longer in that position
        elsif @board[start_pos].nil?
            raise "No piece at pos #{start_pos}" 
        elsif !@board[end_pos].nil?
            raise "Space occupied"
        end
    end
end

# Your Board class should hold a 2-dimensional array (an array of arrays). 
# Each position in the board either holds a moving Piece or a NullPiece (NullPiece will inherit from Piece).

# The Board class should have a #move_piece(start_pos, end_pos) method. 
# This should update the 2D grid and also the moved piece's position. You'll want to raise an exception if:
# there is no piece at start_pos or
# the piece cannot move to end_pos.