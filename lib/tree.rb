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
  #           return
  #         end
  #       else
  #         if !current.right.nil?
  #           current = current.right
  #         else
  #           current.right = TreeNode.new(key, value)
  #           return
  #         end
  #       end
  #     end
  #   end
  # end

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
  # Space Complexity: O(log n)
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
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    raise NotImplementedError
  end

  def delete
    raise NotImplementedError
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
