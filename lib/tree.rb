class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

   def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
   end

  def inorder

    inorder_array = []

    inorder_array += @left.inorder unless @left.nil?
    inorder_array << { key: @key, value: @value }
    inorder_array += @right.inorder unless @right.nil?
    
    return inorder_array

  end

  def preorder

    preorder_array = []

    preorder_array << { key: @key, value: @value }
    preorder_array += @left.preorder unless left.nil?
    preorder_array += @right.preorder unless right.nil?
    

    return preorder_array

  end

  def postorder

    postorder_array = []

    postorder_array += @left.postorder unless left.nil?
    postorder_array += @right.postorder unless right.nil?
    postorder_array << { key: @key, value: @value }

    return postorder_array
    
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


  # Time Complexity: O (log n)
  # Space Complexity: O(1)
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
  def inorder
    
    return [] if @root.nil?
    return @root.inorder

  end
  

#   # Time Complexity: 
#   # Space Complexity: 
  def preorder
    
    return [] if @root.nil?
    return @root.preorder

  end

#   # Time Complexity: 
#   # Space Complexity: 
  def postorder
    
    return [] if @root.nil?
    return @root.postorder

  end

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
