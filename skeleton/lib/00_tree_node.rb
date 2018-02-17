require 'byebug'
class PolyTreeNode

  # attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    remove_from_parent
    @parent = node
    unless @parent == nil
      add_to_new_parent
    end
  end

  def remove_from_parent
    @parent.children.delete(self) unless self.parent.nil?
  end

  def add_to_new_parent
    @parent.children << self unless @parent.children.include?(self)
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise "Not a child!" unless self.children.include?(node)
    node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

      self.children.each do |child|
        pos_target = child.dfs(target_value) # unless child == []
        return pos_target if pos_target
      end
      nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      current = queue.shift
      return current if current.value == target_value
      current.children.each { |kid| queue << kid }
    end
    nil

  end



  def inspect
    "#{self.value}"
  end



end
