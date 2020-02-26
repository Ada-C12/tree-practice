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
    
    # finds the root and assigns it to current
    current = @root 
    
    # creates a temporary node because we're going to add it to the structure regardless
    temp = TreeNode.new(key, value) 
    
    # evaluates if the tree is empty, if so it adds the temporary node to the root and then returns 
    if @root == nil 
      @root = temp
      return
      
      # otherwise it calls the add helper, passing into it the root as the current (starting) node, and the temporary node
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
    list.push(current_node)
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
