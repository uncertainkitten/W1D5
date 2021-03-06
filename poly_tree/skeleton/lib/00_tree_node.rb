class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node = nil)
    @parent.children.delete(self) if @parent != nil
    @parent = node
    node.children << self if @parent != nil
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "node is not a child" unless @children.include?(child_node)
    child_node.parent = nil
    #@children.delete(child_node)
  end

  def dfs(target_value)
    if self.value == target_value
      return self
    else
      output = nil
      @children.each do |child|
        output ||= child.dfs(target_value)
      end
    return output
    end
  end

  def bfs(target_value)
    nodes = [self]
    until nodes.empty?
      current_node = nodes.pop
      return current_node if current_node.value == target_value
      current_node.children.each { |child| nodes.unshift(child)}
    end
    nil
  end

  def inspect
    puts "#{parent.inspect}, #{value}"
  end
end
