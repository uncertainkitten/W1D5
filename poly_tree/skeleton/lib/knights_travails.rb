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
  end

  def self.valid_moves(pos)
    pos.each { |v| return false if v > 7 || v < 0}
    !self.visited_positions.include?(pos)
  end

  def find_path(end_pos)
  end

  def trace_path_back
  end
end
