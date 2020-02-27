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
  
  # Time Complexity: O(log n) for a balanced tree, O(n) for unbalanced
  # Space Complexity: O(log n) for a balanced tree, O(n) for unbalanced
  def add(key, value)
    if @root.nil?
      @root = TreeNode.new(key, value)
    else
      add_helper(@root, key, value)
    end
  end
  
  def add_helper(current, key, value)
    if current.nil?
      return TreeNode.new(key, value)
    else
      if key < current.key
        current.left = add_helper(current.left, key, value)
      else
        current.right = add_helper(current.right, key, value)
      end
    end
    return current
  end
  
  # Time Complexity: O(log n) for a balanced tree, O(n) for unbalanced
  # Space Complexity: O(log n) for a balanced tree, O(n) for unbalanced
  def find(key)
    return nil if @root.nil?
    
    find_helper(@root, key)
  end
  
  def find_helper(current, key)
    return nil if current.nil?
    
    if key == current.key
      return current.value
    elsif key < current.key
      find_helper(current.left, key)
    else
      find_helper(current.right, key)
    end
    
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    inorder_helper(@root, [])
  end
  
  def inorder_helper(current, list)
    return list if current.nil?
    
    inorder_helper(current.left, list)
    list << {key: current.key, value: current.value}
    inorder_helper(current.right, list)
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    preorder_helper(@root, [])
  end
  
  def preorder_helper(current, list)
    return list if current.nil?
    
    list << {key: current.key, value: current.value}
    preorder_helper(current.left, list)
    preorder_helper(current.right, list)
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    postorder_helper(@root, [])
  end
  
  def postorder_helper(current, list)
    return list if current.nil?
    
    postorder_helper(current.left, list)
    postorder_helper(current.right, list)
    list << {key: current.key, value: current.value}
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    return 0 if @root.nil?
    
    height_helper(@root, 0)
  end
  
  def height_helper(current, height)
    return height if current.nil?
    
    height +=1
    left = height_helper(current.left, height)
    right = height_helper(current.right, height)
    
    if left > right
      return left
    else
      return right
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
