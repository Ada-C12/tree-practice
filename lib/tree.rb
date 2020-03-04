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

  def add_helper(node, key, value)
    if node.nil?
      node = TreeNode.new(key, value)
    elsif key < node.key
      node.left = add_helper(node.left, key, value)
    elsif key > node.key
      node.right = add_helper(node.right, key, value)
    end
    return node
  end

  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find(key)
    return find_helper(@root, key)
  end

  def find_helper(node, key)
    if node.nil?
      return nil
    elsif node.key == key
      return node.value
    elsif key < node.key
      return find_helper(node.left, key)
    elsif key > node.key
      return find_helper(node.right, key)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    return inorder_helper(@root, [])
  end

  def inorder_helper(node, list) # list is a reference, so can pass around
    if node.nil?
      return list
    end

    inorder_helper(node.left, list)
    list << {key: node.key, value: node.value}
    inorder_helper(node.right, list)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(node, list) # list is a reference, so can pass around
    if node.nil?
      return list 
    end

    list << {key: node.key, value: node.value}
    preorder_helper(node.left, list)
    preorder_helper(node.right, list)
  end


  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(node, list) # list is a reference, so can pass around
    if node.nil?
      return list
    end

    postorder_helper(node.left, list)
    postorder_helper(node.right, list)
    list << {key: node.key, value: node.value}
  end

  def height
    return height_helper(@root)
  end

  def height_helper(node)
    if node.nil?
      return 0
    end
    left_length = height_helper(node.left)
    right_length = height_helper(node.right)

    if left_length > right_length
      longest_length = left_length
    else
      longest_length = right_length
    end
    longest_length += 1 # Add one for the current node
    return longest_length

  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity:
  def bfs
    list = []
    return list if @root.nil?
    queue = [@root]

    until queue.empty
      current = queue.shift
      queue.push(current.left) unless current.left.nil?
      queue.push(current.right) unless current.right.nil?

      # list << { key: current.key, value: current.value }
    end
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
