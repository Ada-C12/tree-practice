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
  # Space Complexity: O(1)
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  # Time Complexity: O(logn)
  # Space Complexity: O(1)
  def find(key)
    current = @root

    return nil if current.nil?

    until current.key == key
      if current.key > key
        current = current.left
      else
        current = current.right
      end
    end
    return current.value
  end

  def inorder_helper(current_node, list) #l, n, r
    return list if current_node.nil?

    inorder_helper(current_node.left, list)
    list << { key: current_node.key, value: current_node.value} # root is getting pushed to the list 
    inorder_helper(current_node.right, list)
    return list
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n) n represents the number of nodes in a tree
  def inorder
    return inorder_helper(@root, [])
  end

  def preorder_helper(current_node, list) #n, l, r
    return list if current_node.nil?

    list << {key: current_node.key, value: current_node.value}
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
    return list
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    preorder_helper(@root, [])
  end

  def postorder_helper(current_node, list) #l, r, n
    return list if current_node.nil?

    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << {key: current_node.key, value: current_node.value}
    return list
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    postorder_helper(@root, [])
  end

  def height_helper(current_node)
    return 0 if current_node.nil?

    left_depth = height_helper(current_node.left)
    right_depth = height_helper(current_node.right)

    if left_depth > right_depth
      return left_depth + 1
    else
      return right_depth + 1
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def height
    height_helper(@root)
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
