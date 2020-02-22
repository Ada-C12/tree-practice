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
    @root =  add_helper(@root, key, value)
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
    return preorder_helper(@root, [])
  end

  def preorder_helper(current, list)
    return list if current.nil?
    list << {key: current.key, value: current.value}
    preorder_helper(current.left, list)
    preorder_helper(current.right, list)
    return list
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(current, list)
    return list if current.nil?
    postorder_helper(current.left, list)
    postorder_helper(current.right, list)
    list << {key: current.key, value: current.value}
    return list
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def height
    return height_helper(@root, 0, 1)
  end

  def height_helper(current, max, count)
    return max if current.nil?

    max = count if count > max
    height_helper(current.left, max, (count + 1))
    height_helper(current.right, max, (count + 1))
    
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
