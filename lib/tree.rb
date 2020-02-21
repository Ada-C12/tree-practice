class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  # Time Complexity: Olog(n) where n if the number of nodes
  # Space Complexity: Olog(n) where n is the number of functional calls
  def add(key, value)
    # raise NotImplementedError
    # Non recursion
    # if @root = nil? 
    #   return @root = TreeNode.new(key, value)
    # else
    #   current = @root
    #   while true
    #     if key < current.key
    #       if !current.left.nil?
    #         current = current.left
    #       else
    #         current.left = TreeNode.new(key,value)
    #         return
    #       end
    #     else
    #       if !current.right.nil?
    #         current = current.right
    #       else
    #         current.right = TreeNode.new(key,value)
    #         return
    #       end
    #     end
    #   end
    # end

    # until current.left == nil && current.right == nil
    #   if key < current.key
    #     current.left = TreeNode.new
    #   else
    #     current.right = TreeNode.new
    #   end
    # end

    # Recursive Method
    @root = add_helper(@root, key, value)
  end

  #Recursive helper method
  def add_helper(current_node, key, value)
    return TreeNode.new(key,value) if current_node.nil?
    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
    return current_node
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    # raise NotImplementedError
    return nil if @root == nil
    find_help(@root, key)
  end

  def find_help(current_node, key)
    return nil if current_node.nil?
    return current_node.value if current_node.key == key
    # return nil if current_node.left == nil && current_node.right == nil

    if key < current_node.key
      current_node = current_node.left
      find_help(current_node, key)
    else
      current_node = current_node.right
      find_help(current_node,key)
    end
  end

  # Time Complexity: O(n) where n is number of nodes
  # Space Complexity: O(n) where n is the number of function calls
  def inorder
    # raise NotImplementedError
    return inorder_helper(@root, [])
  end
  def inorder_helper(current_node,list)
    return list if current_node.nil? #base case?

    inorder_helper(current_node.left, list)
    list << { key: current_node.key, value: current_node.value }
    inorder_helper(current_node.right, list)
    
    return list
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    raise NotImplementedError
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    raise NotImplementedError
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
