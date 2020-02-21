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
    @root = add_helper(@root, key, value)
  end

  # recursive helper method 
  def add_helper(current_node, key, value)
    #  base case 
    return TreeNode.new(key, value) if current_node.nil?
    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else 
      current_node.right = add_helper(current_node.right, key, value)
    end
    return current_node
    
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    # raise NotImplementedError
    current = @root
    return nil if current.nil?
    return find_helper(root, key)
  end

  def find_helper(current_node, key)
    return current_node.value if current_node.key == key

    if key <= current_node.key
      current_node.left = find_helper(current_node.left, key)
    else
      current_node.right = find_helper(current_node.right, key)
    end

  end



  def inorder_helper(current_node, list)
    return list if current_node.nil? 

    inorder_helper(current_node.left, list)
    list << { key: current_node.key, value: current_node.value }
    inorder_helper(current_node.right, list)
    return list 
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return inorder_helper(@root, [])
  end


  # Time Complexity: O(n) call visit on each node exactly once
  # Space Complexity: 
  # current node, left subtree, right subtree
    # 1. visit node
    # 2. traverse left subtree
    # 3. traverse right subtree
  def preorder
    return preorder_helper(@root, [])

  end

  def preorder_helper(current_node, list)
   
    return list if current_node.nil?
    list <<  { key: current_node.key, value: current_node.value}
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
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


# long form nodes from add 
 # if @root.nil?
    #   @root = TreeNode.new(key, value)
    # else
      # current = @root
    
      # while true
      # if key < current.key
      #   if !current.left.nil?
      #     current = current.left
      #   else 
      #     current.left = TreeNode.new(key, value)
      #     return
      #   end
      # else
      #   if !current.right.nil?
      #     current = current.right
      #   else 
      #     current.right = TreeNode.new(key, value)
      #     return
      #   end
      # end

    
    # return add_helper(@root, value)