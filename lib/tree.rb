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
  
  # Time Complexity: 
  # Space Complexity:   
  def add(key, value)
    
    current = @root 
    temp = TreeNode.new(key, value) 
    
    if @root == nil 
      @root = temp
      return
      
    else
      add_helper(@root, temp)
    end
  end
  
  def add_helper(current_node, temp)
    if current_node == nil
      return temp
    end
    
    if temp.key < current_node.key 
      current_node.left = add_helper(current_node.left, temp)
    else
      current_node.right = add_helper(current_node.right, temp)
    end
    return current_node
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    current = @root
    if current == nil
      return nil
    elsif current.key == key
      return current.value
    else
      find_helper(current, key)
    end
  end
  
  def find_helper (current, key) 
    if current.key == key
      return current.value
    elsif current.key > key && current.left != nil 
      find_helper(current.left, key)
    elsif current.key > key
      return nil
    elsif current.key < key && current.right != nil
      find_helper(current.right, key)
    elsif current.key < key
      return nil
    end
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def inorder
    if @root == nil
      return []
    end
    inorder_helper(@root, [])
  end
  
  def inorder_helper(current_node, list)
    
    if current_node == nil
      return list
    end
    
    inorder_helper(current_node.left, list)
    list.push({key: current_node.key, value: current_node.value})
    inorder_helper(current_node.right, list)
    return list
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def preorder
    if @root == nil
      return []
    else
      return preorder_helper(@root, [])
    end
  end
  
  def preorder_helper(current_node, list)
    if current_node == nil
      return list
    end
    
    list.push({key: current_node.key, value: current_node.value})
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
    
    return list
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def postorder
    if @root == nil
      return []
    else
      return postorder_helper(@root, [])
    end
  end
  
  def postorder_helper(current_node, list)
    if current_node == nil
      return list
    end
    
    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list.push({key: current_node.key, value: current_node.value})
    
    return list
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def height
    if @root == nil
      return 0
    elsif @root.left == nil && @root.right == nil
      return 1
    end
    
    counter = 0
    high_value = 1 # set to 1 bc if this method is called, the root is a parent
    
    return height_helper(@root, counter, high_value)
    
  end
  
  def height_helper(current_node, counter, high_value)
    
    if current_node == nil
      counter += 1
      if counter > high_value
        high_value = counter
      end
      return high_value
    end
    
    height_helper(current_node.left, counter, high_value)
    height_helper(current_node.right, counter, high_value)
    return high_value
    
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
