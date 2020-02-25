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
    # key is what you are using to sort the tree
    # value is what the value in the node is
    @root = add_helper(@root, key, value)
  end
  
  # Time Complexity: 
  # Space Complexity: 
  
  def find_helper(current_node, key)
    return nil if current_node.nil?
    return current_node.value if current_node.key == key
    
    if key < current_node.key
      find_helper(current_node.left, key)
    else key < current_node.key
      find_helper(current_node.right, key)
    end
  end 
  
  def find(key)
    return find_helper(@root, key)
  end
  
  # Time Complexity: 
  # Space Complexity: 
  
  def inorder_helper(current_node, list) 
    return list if current_node.nil? 
    
    inorder_helper(current_node.left, list)
    list << {key: current_node.key, value: current_node.value}
    
    inorder_helper(current_node.right, list)
    return list
  end
  
  def inorder
    # might be helpful to create a helper method
    # return an array in the order we hit them in
    list = []
    inorder_helper(@root, list)
  end
  
  # Time Complexity: 
  # Space Complexity: 

  def preorder_helper(current_node, list) 
    return list if current_node.nil? 
    list << {key: current_node.key, value: current_node.value}

    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)

    return list 
  end 

  def preorder
    list = []
    return preorder_helper(@root, list)
  end
  
  # Time Complexity: 
  # Space Complexity: 

  def postorder_helper(current_node, list)
    return [] if current_node.nil?

    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    # push at the end bc that is when current node is the root & postorder traversal is: left, right, root
    list << {key: current_node.key, value: current_node.value}
    return list
  end 

  def postorder
    list = []
    return postorder_helper(@root, list)
  end
  
  # Time Complexity: 
  # Space Complexity: 

  def height_helper(current_node)
    return 0 if current_node.nil? 
    
    left_height = height_helper(current_node.left)
    right_height = height_helper(current_node.right)

    if left_height > right_height
      return left_height + 1
    else
      return right_height + 1
    end 
  end 

  def height
    height = 0
    return height_helper(@root)
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
