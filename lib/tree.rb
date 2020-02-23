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

  def add_helper(current_node, key, value)
    return TreeNode.new(key, value) if current_node.nil?

    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
    return current_node
  end

  # Time Complexity: O(log(n)) up to O(n)
  # Space Complexity: O(n)
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  def find_helper(current_node, key)
    return nil if current_node.nil?

    if key < current_node.key
      return find_helper(current_node.left, key)
    elsif key > current_node.key
      return find_helper(current_node.right, key)
    else
      return current_node.value
    end
    return current_node
  end

  # Time Complexity:
  # Space Complexity:
  def find(key)
    find_helper(@root, key)
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

  def preorder_helper(current_node, list)
    return list if current_node.nil?
    list << { key: current_node.key, value: current_node.value }
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
    return list
  end

  # Time Complexity:
  # Space Complexity:
  def preorder
    return preorder_helper(@root, [])
  end

  def postorder_helper(current_node, list)
    return list if current_node.nil?
    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << { key: current_node.key, value: current_node.value }
    return list
  end

  # Time Complexity:
  # Space Complexity:
  def postorder
    return postorder_helper(@root, [])
  end

  def height_helper(current_node, current_height)
    if current_node.nil?
      return current_height
    end

    current_height += 1
    left_height = height_helper(current_node.left, current_height)
    right_height = height_helper(current_node.right, current_height)

    if left_height > right_height
      return left_height
    else
      return right_height
    end
  end

  # Time Complexity:
  # Space Complexity:
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
