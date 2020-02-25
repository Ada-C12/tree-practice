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

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  def add_helper(current_node, key, value)
    return TreeNode.new(key, value) if current_node.nil?

    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
    return current_node
  end 

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def find(key)
    return nil if @root.nil?
    return find_helper(@root, key)
  end

  def find_helper(current_node, key)
    return current_node.value if current_node.key == key 

    if key < current_node.key 
      find_helper(current_node.left, key)
    else 
      find_helper(current_node.right, key)
    end 
  end 

  # For traversals: Space required is proportional to height of tree which is equal to the number of nodes in the tree in the worst case (skewed trees)
  
  # Time Complexity: O(n)
  # Space Complexity: O(n) or O(h) because the max # of memory addresses on the stack at the same time is the same as the tree height
  def inorder
    return inorder_helper(@root, [])
  end

  def inorder_helper(current_node, list)
    # left, root, right
    return list if current_node.nil?
    # recursion; left side first
    inorder_helper(current_node.left, list)
    list << {key: current_node.key, value: current_node.value}
    inorder_helper(current_node.right, list)
    return list
  end 

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(current_node, list)
    # root, left, right
    return list if current_node.nil?
    list << {key: current_node.key, value: current_node.value}
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
    return list 
  end 

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(current_node, list)
    # left, right, root 
    return list if current_node.nil?

    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << {key: current_node.key, value: current_node.value}

  end 

  # Time Complexity: 0(n)
  # Space Complexity: O(n)
  #Height is distance from the best accessible leaf node 
  #Height of a tree would be equal to max depth of any node in the tree 
  def height
    return 0 if @root.nil? 
    return height_helper(@root, 0)
  end

  def height_helper(current_node, max)
    return max if current_node.nil? 

    #Make a recursive call to find the height of the left subtree 
    left_height = height_helper(current_node.left, max)

    #Make a recursive call to find the height of the right subtree 
    right_height = height_helper(current_node.right, max)

    #The height of the tree would be the greater of both of these values plus one
    return [left_height, right_height].max + 1 
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
