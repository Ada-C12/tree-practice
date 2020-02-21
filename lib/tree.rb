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

    add_helper(@root, key, value)
    # ITERATION SOLUTION: 
    # curr = @root
    # while true
    #   if key < curr.key
    #     if !curr.left.nil?
    #       curr = curr.left
    #     else
    #       curr.left = TreeNode.new(key, value)
    #     end
    #   elsif key > curr.key 
    #     if !curr.right.nil?
    #       curr = curr.left
    #     else
    #       curr.left = TreeNode.new(key, value)
    #     end
    #   else
    #     curr.value = value
    #   end
    # end
  end

  # Time Complexity: 
  # Space Complexity:
  def find(key)
    return nil if @root.nil?

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

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    raise NotImplementedError
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
