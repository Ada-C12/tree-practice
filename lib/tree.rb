class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right
  
  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end
  
  def inorder(list)
    list = left.inorder(list) unless left.nil?
    list << {key: key, value: value}
    list = right.inorder(list) unless right.nil?
    return list
  end
  
  def preorder(list)
    list << {key: key, value: value}
    list = left.preorder(list) unless left.nil?
    list = right.preorder(list) unless right.nil?
    return list
  end
  
  def postorder(list)
    list = left.postorder(list) unless left.nil?
    list = right.postorder(list) unless right.nil?
    list << {key: key, value: value}
    return list
  end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end
  
  # Time Complexity: O(n)
  # Space Complexity: o(n)
  def add_helper(current, key, value)
    return TreeNode.new(key, value) if current.nil?
    
    if key <= current.key
      current.left = add_helper(current.left, key, value)
    else
      current.right = add_helper(current.right, key, value)
    end
    return current
  end
  
  def add(key, value)
    @root = add_helper(@root, key, value)
  end
  
  # Time Complexity: O(1)
  # Space Complexity: O1
  def find(key)
    current = @root
    until current.nil?
      if current.key == key
        return current.value
      elsif key > current.key
        current = current.right
      else
        current = current.left
      end
    end
    return nil
  end
  
  # Time Complexity: On
  # Space Complexity: On
  def inorder_helper 
    return inorder_helper(@root, [])
    list = left.inorder(list) unless left.nil?
    list << {key: key, value: value}
    list = right.inorder(list) unless right.nil?
    return list
  end
  
  def inorder
    list = []
    return list if @root.nil?
    return @root.inorder(list)
  end
  
  # Time Complexity: On
  # Space Complexity: On
  def preorder
    list = []
    return list if @root.nil?
    return @root.preorder([])
  end
  
  # Time Complexity:  On
  # Space Complexity: On
  def postorder
    list = []
    return list if @root.nil?
    return @root.postorder([])
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def max (num1, num2)
    if num1 > num2
      return num1
    else
      return num2
    end
  end
  
  def height_helper(current)
    return 0 if current.nil?
    return 1 + max(height_helper(current.left), height_helper(current.right))
  end
  
  def height
    return height_helper(@root)
  end
  
  def delete_helper(current, key)
    return nil if current.nil?
    
    if current.key > key
      current.left = delete_helper(current.left, key)
      return current
    end
    
    if current.key < key
      current.right = delete_helper(current.right, key)
      return current
    end
    
    if current.left.nil? && current.right.nil?
      return nil
    end
    
    if current.left.nil?
      return current.right
    end
    
    if current.right.nil?
      return current.left
    end
    
  end
  
  def delete(key)
    value = self.find(key)
    @root = delete_helper(@root, key)
    return value
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
