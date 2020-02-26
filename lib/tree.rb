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

  # Time Complexity: O(logn) in worst case scenario
  # Space Complexity: O(1) always just adding 1 new node
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

  # Time Complexity: O(logn) since binary
  # Space Complexity: O(1) since adding nothing new
  def find(key)
    return find_helper(@root, key)
  end

  def find_helper(current_node, key)
    return nil if current_node.nil?
    return current_node.value if key == current_node.key

    if key < current_node.key
      find_helper(current_node.left, key)
    else
      find_helper(current_node.right, key)
    end
  end


  # Time Complexity: O(n) since going to each node once, backtracking but still backtracking a smaller number of times than there are nodes, so it depends on the number of nodes no matter what.
  # Space Complexity: O(1) - nothing being made
  def inorder
    return inorder_helper(@root, [])
  end

  # helper
  def inorder_helper(current_node, list)
    # left, root, right
    return list if current_node.nil?
    # recursion! left side first
    inorder_helper(current_node.left, list)
    list << {key: current_node.key, value: current_node.value}
    inorder_helper(current_node.right, list)
    return list
  end

  # Time Complexity: same as inorder
  # Space Complexity: same as inorder
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

  # Time Complexity: same as inorder
  # Space Complexity: same as inorder
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(current_node, list)
    # left, right, root
    return list if current_node.nil?
    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << {key: current_node.key, value: current_node.value}
    return list
  end

  # Time Complexity: O(n) since each node is visited once
  # Space Complexity: O(1) since it doesn't make anything new
  def height
    return height_helper(@root, 0)
  end

  def height_helper(current_node, current_height)
    return 0 if current_node.nil?
    left_height = height_helper(current_node.left, current_height)
    right_height = height_helper(current_node.right, current_height)
    if left_height > right_height
      return left_height + 1
    else
      return right_height + 1
    end

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
