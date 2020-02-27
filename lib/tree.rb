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
  # Space Complexity: O(log n)
  def add_helper(curr, key, value)
    return TreeNode.new(key, value) if curr.nil?

    if key < curr.key
      curr.left = add_helper(curr.left, key, value)
    else
      curr.right = add_helper(curr.right, key, value)
    end

    return curr
  end

  def add(key, value)
    @root = TreeNode.new(key, value) if @root.nil?

    return add_helper(@root, key, value)
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find(key)
    curr = @root

    until curr.nil?
      if key > curr.key
        curr = curr.right
      elsif key < curr.key
        curr = curr.left
      else
        return curr.value
      end
    end

    return nil
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder_helper(curr, list)
    return list if curr.nil?

    inorder_helper(curr.left, list)
    list << {key: curr.key, value: curr.value}
    inorder_helper(curr.right, list)
  end
  
  def inorder
    return inorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(log n)
  def preorder_helper(curr, list) 
    return list if curr.nil?

    list << { key: curr.key, value: curr.value }
    preorder_helper(curr.left, list)
    preorder_helper(curr.right, list)
  end
  
  def preorder
    return preorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(log n)
  def postorder_helper(curr, list)
    return list if curr.nil?

    postorder_helper(curr.left, list)
    postorder_helper(curr.right, list)
    list << { key: curr.key, value: curr.value }
  end

  def postorder
    return postorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(log n)
  def height_helper(curr, height)
    return height if curr.nil?

    height = [left, right].max
    
    left = height_helper(curr.left, height + 1)
    right = height_helper(curr.right, height + 1)
  end

  def height
    return height_helper(@root, 0)
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
