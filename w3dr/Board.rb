require_relative "Card.rb"

class Board 
    

    def initialize(size)
        @board = Array.new(size) {[]}
        # @card = Card.new(face_value, face_up)
    end 

    def populate
        
        
        (0...@board.length).each do |row|
             (0...@board.length).each do |col|
                @board[row][col] = Card.new_cards(@board.length).shift 
             end 
          
        end 

    end 

end 