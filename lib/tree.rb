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
    add_helper(@root, key, value)
  end

  def add_helper(current, key, value)
    return TreeNode.new(key, value) if current.nil?
    if key < current.key
      current.left = add_helper(current.left, key, value)
    else
      current.right = add_helper(current.right, key, value)
    end
    return current
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return find_helper(@root, key)
  end

  def find_helper(current, key)
    return nil if current.nil?
    return current.value if current.key == key
    if key > current.key
      return find_helper(current.right, key)
    else
      return find_helper(current.left, key)
    end
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return inorder_helper(@root, [])
  end

  def inorder_helper(current, list)
    return list if current.nil?

    inorder_helper(current.left, list)
    list << { key: current.key, value: current.value }
    inorder_helper(current.right, list)
    
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
