require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
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
  def children
    children_moves = []
    (0..2).each do |x|
      (0..2).each do |y|
        if @board[[x,y]] == nil
          new_board = @board.dup
          new_board[[x,y]] = @next_mover_mark
          current_mark = @next_mover_mark
          if @next_mover_mark == :o
            current_mark = :x
          else
            current_mark = :o
          end
          new_node = TicTacToeNode.new(new_board, current_mark, [x,y])
          children_moves << new_node
        end
      end
    end
    return children_moves
  end
end
