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
    new_node = TreeNode.new(key, value)

    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node, key)
    end
  end

  def add_helper(current, new_node, key)
    return new_node if current.nil?

    if key <= current.key
      current.left = add_helper(current.left, new_node, key)
    else
      current.right = add_helper(current.right, new_node, key)
    end
    return current
  end


  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    if @root.nil?
      return nil
    else
      find_helper(key, @root)
    end
  end

  def find_helper(key, current)
    return nil if current.nil?
    if current.key == key
      return current.value
    elsif key > current.key
      find_helper(key, current.right)
    else
      find_helper(key, current.left)
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
    list << { key: current.key, value: current.value}
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
