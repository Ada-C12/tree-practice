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

  # Time Complexity:o(log n )
  # Space Complexity: o(n)
  def add(key, value)
    # key is what you are using to compare
    # value is what you store
    # if @root.nil?
    #   @root = TreeNode.new(key, value)
    # else
    #   current = @root
    #   while true
    #     if key < current.key
    #       if !current.left.nil?
    #         current = current.left
    #       else
    #         current.left = TreeNode.new(key, value)
    #         return
    #       end
    #     else
    #       if !current.right.nil?
    #         current = current.right
    #       else
    #         current.right = TreeNode.new(key, value)
    #         return
    #       end
    #     end
    #   end
    # end
    @root = add_helper(@root, key, value)
  end

  def add_helper(current_node, key, value)
    # base case when the current node is nil
    return TreeNode.new(key, value) if current_node.nil?
    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
    return current_node
  end

  # Time Complexity:o(log n)
  # Space Complexity:o(n)
  def find(key)
    find_helper(@root, key)
  end

  def find_helper(current_node, key)
    return nil if current_node.nil?
    return current_node.value if current_node.key == key
    if key < current_node.key
      return find_helper(current_node.left, key)
    elsif key > current_node.key
      return find_helper(current_node.right, key)
    end
  end

  # Time Complexity: o(n)
  # Space Complexity: o(n)
  def inorder
    inorder_helper(@root, [])
  end

  def inorder_helper(current_node, list)
    return list if current_node.nil?
    inorder_helper(current_node.left, list)
    list << { key: current_node.key, value: current_node.value }
    inorder_helper(current_node.right, list)

    return list
  end

  # Time Complexity: o(n)
  # Space Complexity:o(n)
  def preorder
    preorder_helper(@root, [])
  end

  def preorder_helper(current_node, list)
    return list if current_node.nil?

    list << { key: current_node.key, value: current_node.value }
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
    return list
  end

  # Time Complexity: o(n)
  # Space Complexity: o(n)
  def postorder
    postorder_helper(@root, [])
  end

  def postorder_helper(current_node, list)
    return list if current_node.nil?

    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << { key: current_node.key, value: current_node.value }
    return list
  end

  # Time Complexity: o(n)
  # Space Complexity: o(n)
  def height
    height_helper(@root, 0)
  end

  def height_helper(current_node, height)
    return 0 if current_node.nil?

    left_max = height_helper(current_node.left, height)
    right_max = height_helper(current_node.right, height)
    if left_max > right_max
      return height = left_max + 1
    else
      return height = right_max + 1
    end
  end

  # Optional Method
  # Time Complexity:
  # Space Complexity:
  #   def bfs
  #     raise NotImplementedError
  #   end

  #   # Useful for printing
  #   def to_s
  #     return "#{self.inorder}"
  #   end
end
