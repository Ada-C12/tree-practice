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
  
  def add_helper(current_node, key, value)
    return TreeNode.new(key, value) if current_node.nil?
    
    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
    
    return current_node
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)
    @root = add_helper(@root, key, value)
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    raise NotImplementedError
  end
  
  def inorder_helper(current_node, list)
    return list if current_node.nil?
    
    inorder_helper(current_node.left, list)
    list << {key: current_node.key, value: current_node.value}
    inorder_helper(current_node.right, list)
    
    return list
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return inorder_helper(@root, [])
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
