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
  # Space Complexity: O(1)
  def add(key, value)
    
    if @root.nil?
      return @root = TreeNode.new(key, value)
    end

    curr = @root

    until curr.nil?
      prev_node = curr
      if key <= curr.key
        curr = curr.left
      else
        curr = curr.right
      end
    end

    if key <= prev_node.key
      prev_node.left = TreeNode.new(key, value)
    else
      prev_node.right = TreeNode.new(key, value)
    end


  end


  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    
    curr = @root
    
    while !curr.nil?
      return curr.value if curr.key == key

      if key < curr.key
        curr = curr.left
      else
        curr = curr.right
      end
    end

  end

#   # Time Complexity: 
#   # Space Complexity: 
#   def inorder
#     raise NotImplementedError
#   end

#   # Time Complexity: 
#   # Space Complexity: 
#   def preorder
#     raise NotImplementedError
#   end

#   # Time Complexity: 
#   # Space Complexity: 
#   def postorder
#     raise NotImplementedError
#   end

#   # Time Complexity: 
#   # Space Complexity: 
#   def height
#     raise NotImplementedError
#   end

#   # Optional Method
#   # Time Complexity: 
#   # Space Complexity: 
#   def bfs
#     raise NotImplementedError
#   end

#   # Useful for printing
#   def to_s
#     return "#{self.inorder}"
#   end
end
