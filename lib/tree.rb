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
  # Space Complexity: O(n)
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
  
  # Time Complexity: O(log n)
  # Space Complexity: O(n)
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
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
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
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
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
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
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
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    if @root == nil
      return 0
    elsif @root.left == nil && @root.right == nil
      return 1
    end
    
    return height_helper(@root)
    
  end
  
  def height_helper(current_node)
    
    if current_node == nil
      return 0
    end
    
    left = height_helper(current_node.left)
    right = height_helper(current_node.right)
    if left > right
      return left + 1
    else
      return right + 1
    end
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
