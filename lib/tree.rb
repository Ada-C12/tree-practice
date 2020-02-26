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

  # Time Complexity: log(n)
  # Space Complexity: log(n)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node, key)
    end
  end

  def add_helper(current, new_node, key)
    return new_node if current.nil?

    if key <= current.key
      current.left = add_helper(current.left, new_node, key)
    else
      current.right = add_helper(current.right, new_node, key)
    end
    return current
  end


  # Time Complexity: log(n)
  # Space Complexity: log(n)
  def find(key)
    if @root.nil?
      return nil
    else
      find_helper(key, @root)
    end
  end

  def find_helper(key, current)
    return nil if current.nil?
    if current.key == key
      return current.value
    elsif key > current.key
      find_helper(key, current.right)
    else
      find_helper(key, current.left)
    end
  end

  def delete(key)
    node = find_node(key)
    unless node.nil?
      remove(node)
    end
  end

  def remove(node)
    if node.left.nil? && node.right.nil?
      node = nil
    elsif !node.left.nil? && node.right.nil?
      node = node.left
    elsif node.left.nil? && !node.right.nil?
      node = node.right
    else
      min_node = find_min_node(node.right)
      node.value = min_node.value
      min_node = nil
    end
  end

  def find_min_node(node)
    if node.left.nil?
      min_node = node
      return min_node
    else
      find_min_node(node.left)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    return inorder_helper(@root, [])
  end

  def inorder_helper(current, list)
    return list if current.nil?

    inorder_helper(current.left, list)
    list << { key: current.key, value: current.value}
    inorder_helper(current.right, list)
    
    return list
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(node, list)
    return list if node.nil?

    list << { key: node.key, value: node.value}
    preorder_helper(node.left, list)
    preorder_helper(node.right, list)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(node, list)
    return list if node.nil?

    postorder_helper(node.left, list)
    postorder_helper(node.right, list)
    list << { key: node.key, value: node.value}
  end

  # Time Complexity: O(n)
  # Space Complexity: O(log n)
  def height
    return height_helper(@root, 0, 0)
  end

  def height_helper(node, left, right)
    if node.nil?
      if left >= right
        return left
      else
        return right
      end
    end

    height_helper(node.left, left + 1, right)
    height_helper(node.right, left, right + 1)
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
