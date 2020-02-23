class TreeNode
  # attr_reader :key, :value
  attr_accessor :left, :right, :key, :value

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
  # Space Complexity: O(n)
  def add_helper(current_node, key, value)
    return TreeNode.new(key, value) if current_node.nil?

    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
    return current_node
  end

  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(n)
  def find_helper(current_node, key)
    return nil if current_node.nil?
    return current_node.value if current_node.key == key

    if key < current_node.key
      current_node = find_helper(current_node.left, key)
    else
      current_node = find_helper(current_node.right, key)
    end
  end

  def find(key)
    find_helper(@root, key)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder_helper(current_node, list)
    return list if current_node.nil?

    # left side
    inorder_helper(current_node.left, list)

    # middle node
    list << { key: current_node.key, value: current_node.value }

    # right side
    inorder_helper(current_node.right, list)

    return list
  end

  def inorder
    return inorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder_helper(current_node, list)
    return list if current_node.nil?

    # middle node
    list << { key: current_node.key, value: current_node.value }

    # left side
    preorder_helper(current_node.left, list)

    # right side
    preorder_helper(current_node.right, list)

    return list
  end

  def preorder
    return preorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder_helper(current_node, list)
    return list if current_node.nil?

    # left side
    postorder_helper(current_node.left, list)

    # right side
    postorder_helper(current_node.right, list)

    # middle node
    list << { key: current_node.key, value: current_node.value }

    return list
  end

  def postorder
    return postorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(h) - h is height of tree
  def height_helper(current_node)
    if current_node.nil?
      return 0
    else
      left_height = height_helper(current_node.left)
      right_height = height_helper(current_node.right)

      if left_height > right_height
        return left_height + 1
      else
        return right_height + 1
      end
    end
  end

  def height
    return height_helper(@root)
  end

  # Optional Methods
  # Time Complexity: O(n)
  # Space Complexity: O(w) - w is width of tree
  def bfs
    result = []

    return result if @root.nil?

    queue = [@root]

    while !queue.empty?
      node = queue.shift

      result << { key: node.key, value: node.value }

      if node.left
        queue << node.left
      end

      if node.right
        queue << node.right
      end
    end

    return result
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def find_parent(current_node, key)
    return nil if current_node.nil?

    if current_node.left && (current_node.left.key == key) || current_node.right && (current_node.right.key == key)
      return current_node
    end

    if key < current_node.key
      current_node = find_parent(current_node.left, key)
    else
      current_node = find_parent(current_node.right, key)
    end
  end

  def find_successor(current_node)
    return current_node if current_node.right.nil?

    find_successor(current_node.right)
  end

  def delete(key)
    parent_node = find_parent(@root, key)
    return nil if !parent_node

    if parent_node.left && (parent_node.left.key == key)
      child = "left"
      target_node = parent_node.left
    else
      child = "right"
      target_node = parent_node.right
    end

    # If node to be deleted is leaf - just remove from tree
    if !target_node.left && !target_node.right
      if child == "left"
        parent_node.left = nil
        return
      else
        parent_node.right = nil
        return
      end

    # If node to be deleted has two children
    elsif target_node.left && target_node.right
      successor = find_successor(target_node.left)
      delete(successor.key)

      if child == "left"
        parent_node.left.key = successor.key
        parent_node.left.value = succesor.value
      else
        parent_node.right.key = successor.key
        parent_node.right.value = successor.value
      end

    # If node only has one child - copy child to node and delete child
    else
      if target_node.left
        temp = target_node.left
      else
        temp = target_node.right
      end

      if child == "left"
        parent_node.left = temp
      else
        parent_node.right = temp
      end
    end
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
