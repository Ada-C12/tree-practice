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

  # Time Complexity: O(h) where h is the max height of the binary search tree.
  # In a best case scenario, time complexity would be O(logn)
  # Space Complexity: O(1)
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  def find_helper(current_node, key)
    return nil if current_node.nil?
    return current_node.value if current_node.key == key

    if key < current_node.key
      find_helper(current_node.left, key)
    else
      find_helper(current_node.right, key)
    end
  end

  # Time Complexity: If tree is balanced, it would be O(logn) n being the size of the tree
  # In a worst case scenario, the time complexity would be O(n)
  # Space Complexity: O(1)
  def find(key)
    return find_helper(@root, key)
  end

  def inorder_helper(current_node, list)
    return list if current_node.nil?

    inorder_helper(current_node.left, list)
    list << { key: current_node.key, value: current_node.value }
    inorder_helper(current_node.right, list)
    return list
  end

  # Time Complexity: O(h) h is the height of the tree
  # Space Complexity: O(h) h is the height of the tree
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

  # Time Complexity: O(h) h is the height of the tree
  # Space Complexity: O(h) h is the height of the tree
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

  # Time Complexity: O(h) h is the height of the tree
  # Space Complexity: O(h) h is the height of the tree
  def postorder
    return postorder_helper(@root, [])
  end

  def height_helper(current_node, max, count)
    return max if current_node.nil?

    if count > max
      max = count
    end

    height_helper(current_node.left, max, count + 1)
    height_helper(current_node.right, max, count + 1)
  end

  # Time Complexity: O(h) h is the height of the tree
  # Space Complexity: O(n)
  def height
    return height_helper(@root, 0, 1)
  end

  # Optional Method
  # Time Complexity:
  # Space Complexity:
  def bfs
    raise NotImplementedError
  end

  def delete(key)
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
