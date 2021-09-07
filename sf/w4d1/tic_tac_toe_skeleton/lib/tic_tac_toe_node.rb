require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark 
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.

  #iterate over board 
  #check if pos is empty
    #dupe board 
    #create node --> next_mover_mark
  #next_mover switches   
  def children
    new_nodes = []
    (0...@board.length).each do |row|
      (0...@board.length).each do |col|
        if @board.empty?([row, col])
          @board[row][col] = @next_mover_mark 
          duped = @board.dup
          if @next_mover_mark == :x 
            next_mark = :o 
          else 
            next_mark = :x
          end 
      
          new_node = TicTacToeNode.new(duped, next_mark, [row, col])
          new_nodes << new_node 
        end 
      end 
    end 
    new_nodes 
  end 

  def 



          
  end

  

   
end
