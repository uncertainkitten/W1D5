require_relative "00_tree_node.rb"
class KnightPathFinder
  attr_reader :root_node
  attr_accessor :visited_positions

  def initialize(starting_pos)
    @root_node = PolyTreeNode.new(starting_pos)
    @visited_positions = [starting_pos]
  end

  def build_move_tree
  end

  def new_move_positions
    x,y = @root_node.value
    possible_moves = [[x+2,y+1],[x+2,y-1],[x-2,y+1],[x-2,y-1],[x+1,y-2],[x+1,y+2],[x-1,y-2],[x-1,y+2]]
    filtered_moves = possible_moves.select {|move| KnightPathFinder.valid_moves(move)}
    filtered_moves.reject! { |f_move| @visited_positions.include?(f_move) }
    @visited_positions += filtered_moves
    filtered_moves
  end

  def self.valid_moves(pos)
    pos.each { |v| return false if v > 7 || v < 0}
  end

  def find_path(end_pos)
  end

  def trace_path_back
  end
end
