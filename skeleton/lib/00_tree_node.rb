class PolyTreeNode

  def initialize(value) 
    @value = value
    @parent = nil 
    @children = Array.new()
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
    if !(@parent.nil?)
      @parent.children.delete(self) 
    end

    if node.nil?
      @parent = nil
    else 
      @parent = node
      node.children << self
    end 
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Node must be child" if child_node.parent.nil?
    child_node.parent = nil
  end

  require 'byebug'
  # def dfs(target_value)
  #   #
  #   x = []
  #   x << self if @value == target_value 
  #   return x[0] if !x.empty?
  #   #return [self] if self.value == target_value

  #   @children.each do |child|
  #     x.concat(child.dfs(target_value))

  #   end

  #   x[0]
  # end

  def dfs(target_value)
    debugger
    return self if self.value == target_value
    @children.each do |child|
       found = child.dfs(target_value)
       return found unless found.nil?
    end
    return nil
  end

  def bfs(target_value)

  end
  
end
