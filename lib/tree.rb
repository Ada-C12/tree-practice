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
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  # def add(key, value)
  #   new_node = TreeNode.new(key, value)
  #   current = @root
  #   if current.nil?
  #     current = new_node
  #   else
  #     done = false
  #     until done
  #       if key <= current.key
  #         if !current.left.nil?
  #           current = current.left
  #         else
  #           current.left = new_node
  #           done = true
  #         end
  #       else
  #         if !current.right.nil?
  #           current = current.right
  #         else
  #           current.right = new_node
  #           done = true
  #         end
  #       end
  #     end
  #   end
  #   return current
  # end

  # Time Complexity: O(log n)
  # Space Complexity: O(n)
  def find(key)
    return find_helper(@root, key)
  end

  # def find(key)
  #   current_node = @root
  #   if current_node.nil?
  #     return nil
  #   else
  #     while true
  #       if current_node.key == key
  #         return current_node.value
  #       elsif current_node.key > key
  #         if current_node.left.nil?
  #           return false
  #         else
  #           current_node = current_node.left
  #         end
  #       else
  #         if current_node.right.nil?
  #           return false
  #         else
  #           current_node = current_node.right
  #         end
  #       end
  #     end
  #   end
  # end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    inorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    preorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    postorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(2n) or O(n)
  def height
    return height_helper(@root)
  end

  # Optional Method
  # Time Complexity:
  # Space Complexity:
  def bfs
    raise NotImplementedError
  end

  def delete(key)
    parent = nil
    current = @root
    # find the node, keeping track of its parent
    result = find_with_parent_helper(current, parent, key)
    return nil if result.nil?
    current = result[:current]
    parent = result[:parent]
    # if the found node has no children
    #   - if the node was parent.right, set parent.right to nil
    #   - if the node was parent.left, set parent.left to nil
    if current.left.nil? && current.right.nil?
      (parent.right == current) \
      ? parent.right = nil \
      : parent.left = nil
    # else if the found node has 1 child
    #   - if child is .right, point parent.right to the child
    elsif !current.right.nil? && current.left.nil?
      (parent.right == current) \
      ? parent.right = current.right \
      : parent.left = current.right
    #   - if child is .left, point parent.left to the child
    elsif !current.left.nil? && current.right.nil?
      (parent.right == current) \
        ? parent.right = current.left \
        : parent.left = current.left
    else
      # else if the found node has 2 children
      #   - find the right child's leftmost leaf
      right_child = current.right
      leftmost_left = right_child.left
      until leftmost_leaf.left.nil?
        leftmost_leaf = leftmost_leaf.left
      end
      #   - copy leftmost leaf to item to delete
      current.value = leftmost_leaf.value
      #   - change right child's .left to point to leftmost leaf's .right
      right_child.left = leftmost_leaf.right
      #   - garbage collector deletes current
    end
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end

  private

  def find_with_parent_helper(current_node, parent_node, key)
    return nil if current_node.nil?
    return {"current": current_node, "parent": parent_node} if current_node.key == key

    if key <= current_node.key
      return find_with_parent_helper(current_node.left, current_node, key)
    else
      return find_with_parent_helper(current_node.right, current_node, key)
    end
  end

  def add_helper(current_node, key, value)
    return TreeNode.new(key, value) if current_node.nil?

    if key <= current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end

    return current_node
  end

  def find_helper(current_node, key)
    return nil if current_node.nil?
    return current_node.value if current_node.key == key

    if key <= current_node.key
      return find_helper(current_node.left, key)
    else
      return find_helper(current_node.right, key)
    end
  end

  def inorder_helper(current_node, list)
    return list if current_node.nil?

    inorder_helper(current_node.left, list)
    list << { key: current_node.key, value: current_node.value }
    inorder_helper(current_node.right, list)

    return list
  end

  def preorder_helper(current_node, list)
    return list if current_node.nil?

    list << { key: current_node.key, value: current_node.value }
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)

    return list
  end

  def postorder_helper(current_node, list)
    return list if current_node.nil?

    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << { key: current_node.key, value: current_node.value }

    return list
  end

  def height_helper(current_node)
    return 0 if current_node.nil?

    left_height = height_helper(current_node.left)
    right_height = height_helper(current_node.right)

    if left_height >= right_height
      return left_height + 1
    else
      return right_height + 1
    end
  end
end
