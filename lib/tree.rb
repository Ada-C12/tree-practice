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

  # Time Complexity:
  # Space Complexity:
  def preorder
    raise NotImplementedError
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

  private

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
end
