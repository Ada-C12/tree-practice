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

  # # the loop way
  # def add(key, value)
  #   if @root.nil?
  #     @root = TreeNode.new(key, value)
  #   else
  #     current = @root
  #     while true

  #       if key < current.key
  #         if !current.left.nil?
  #           current = current.left
  #         else
  #           current.left = TreeNode.new(key, value)
  #         end

  #       else
  #         if !current.right.nil?
  #           current = current.right
  #         else
  #           current.right = TreeNode.new(key, value)
  #         end

  #       end
  #     end
  #   end 
  # end

  # Time Complexity for recursive: O(log n) for a well-balanced tree because with each call we are dividing the number of nodes we need to traverse by (about) one half. The more unbalanced the tree is, the closer the big O will be to O(n) since there's no "other side of the tree" to discard. 
  # Space Complexity for rescursive: same as the time complexity? 

  # the recursive way
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  # recursive helper method
  def add_helper(current_node, key, value)

    # base case
    return TreeNode.new(key, value) if current_node.nil?

    # recursive cases
    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
    return current_node
  end

  # Time Complexity: ranges from O(log n) for a well-balanced tree to O(n) for a totally unbalanced tree
  # Space Complexity: same as time complexity since we have to keep track of previous operations until we hit the base case
  def find(key)
    find_helper(@root, key)
  end

  # find helper
  def find_helper(current_node, key)
    
    # base cases
    return nil if current_node.nil?
    return current_node.value if current_node.key == key

    # if key sought is lower than current_node.key, move to the left
    if key < current_node.key
      find_helper(current_node.left, key)
    else 
      find_helper(current_node.right, key) 
    end

  end

  # Time Complexity: O(n) because we need to traverse every node
  # Space Complexity: also O(n) because we need to keep track of each stack call
  def inorder
    return inorder_helper(@root, [])
  end

  def inorder_helper(current_node, list)
    # traversals for inorder: left-root-right (root)

    # base case
    return list if current_node.nil?

    # recursive cases
    inorder_helper(current_node.left, list)
    list << { key: current_node.key, value: current_node.value }
    inorder_helper(current_node.right, list)

    return list

  end 

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(current_node, list)
    # traversals for preorder: root-left-right

    # base case
    return list if current_node.nil?

    # recursive cases
    list << { key: current_node.key, value: current_node.value }
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
