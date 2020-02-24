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
    # raise NotImplementedError
    @root = add_helper(@root, key, value)
  end

  def add_helper(current_node, key,value)
    return TreeNode.new(key, value) if current_node.nil?

    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else 
      current_node.right = add_helper(current_node.right, key,value)
    end

    return current_node
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(n)
  def find(key)
    # raise NotImplementedError
    find_helper(@root, key)
  end
  
  def find_helper(current_node, key)
    return nil if current_node.nil?
    return current_node.value if current_node.key == key

    if key < current_node.key
      return find_helper(current_node.left, key)
    elsif 
      key > current_node.key
      return find_helper(current_node.right, key)
    end
  
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    # raise NotImplementedError
    return inorder_helper(@root, [])
  end

  def inorder_helper(current_node, list)
    return list if current_node.nil?

    inorder_helper(current_node.left, list)
    list << {key: current_node.key, value: current_node.value}
    inorder_helper(current_node.right, list)

    return list
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    # raise NotImplementedError
    return preorder_helper(@root, [])
  end

  def preorder_helper(current_node, list)
    return list if current_node.nil?

    list << {key: current_node.key, value: current_node.value}
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)

    return list
  end


  # Time Complexity: O(n)
  # Space Complexity:O(n) 
  def postorder
    # raise NotImplementedError
  return postorder_helper(@root, [])
  end

  def postorder_helper(current_node, list)
    return list if current_node.nil?

    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << {key: current_node.key, value: current_node.value}

    return list
  end

  # Time Complexity: O(n)
  # Space Complexity: O(log n)
  def height
    # raise NotImplementedError
    return height_helper(@root, 0)
  end

  def height_helper(current_node, height)
    return height if current_node.nil?

    left = height_helper(current_node.left, height)
    right = height_helper(current_node.right, height)

    if left > right
      return height = left + 1
    else
      return height = right + 1
    end
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
