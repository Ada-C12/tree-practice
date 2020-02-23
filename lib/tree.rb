require 'awesome_print'

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

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def add_helper(current_node, key, value)
    return TreeNode.new(key, value) if current_node.nil?

    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end

    return current_node
  end
  
  def add(key, value)
      @root = add_helper(@root, key, value)
  end


  # Time Complexity: O(log n) where n is number of nodes in tree
  # Space Complexity: O(log n) where n is number of nodes in tree
  def find_helper(current_node, search)
    return nil if current_node.nil?
    
    if current_node.key == search
      return current_node.value
    elsif current_node.key > search
      find_helper(current_node.left, search)
    else
      find_helper(current_node.right, search)
    end
  end
  
  def find(key)
    return nil if @root.nil?
    return find_helper(@root, key)
  end

  # Time Complexity: O(n) where n is number of nodes in tree
  # Space Complexity: O(n) where n is number of nodes in tree
  # return array of all nodes in order 
  def inorder_helper(current_node, list)
    return list if current_node.nil?

    inorder_helper(current_node.left, list) if current_node.left
    list << {key: current_node.key, value: current_node.value}
    inorder_helper(current_node.right, list) if current_node.right
    
    return list
  end

  def inorder
    return inorder_helper(@root, [])
  end

  # Time Complexity: O(n) where n is number of nodes in tree
  # Space Complexity: O(n) where n is number of nodes in tree
  def preorder_helper(current_node, list)
    return list if current_node.nil?

    list << {key: current_node.key, value: current_node.value}
    preorder_helper(current_node.left, list) if current_node.left
    preorder_helper(current_node.right, list) if current_node.right
    
    return list
  end
  
  def preorder
    return preorder_helper(@root, [])
  end

  # Time Complexity: O(n) where n is number of nodes in tree
  # Space Complexity: O(n) where n is number of nodes in tree
  def postorder_helper(current_node, list)
    return list if current_node.nil?

    postorder_helper(current_node.left, list) if current_node.left
    postorder_helper(current_node.right, list) if current_node.right
    list << {key: current_node.key, value: current_node.value}
    
    return list
  end

  def postorder
    return postorder_helper(@root, [])
  end

  # Time Complexity: 
  # Space Complexity: 
  def height_helper
    return 0 
  end
  
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
