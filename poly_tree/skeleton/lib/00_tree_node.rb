class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node = nil)
    @parent.remove_child(self) if @parent != nil
    @parent = node
    node.children << self if @parent != nil
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "node is not a child" unless @children.include?(child_node)
    @children.delete(child_node)
  end
end
