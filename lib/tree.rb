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

  def add_while_loop(key, value)
    if @root.nil?
      @root = TreeNode.new(key, value)
    else
      current = @root
      while true
        if key < current.key
          if !current.left.nil?
            current = current.left
          else
            current.left = TreeNode.new(key, value)
            return
          end
        else
          if !current.right.nil?
            current = current.right
          else
            current.right = TreeNode.new(key, value)
            return
          end
        end
      end
    end
  end

  # Time Complexity: O(logn) 
  # Space Complexity: O(logn) 
  def add(key, value)
    @root = add_helper(@root, key, value)
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

    # Time Complexity: O(logn) 
  # Space Complexity: O(logn) 
  def find(key)
    return nil if @root.nil?
    return find_helper(@root, key).value
  end

  def find_helper(current_node, key)
    return current_node if current_node.key == key

    if key < current_node.key
      return find_helper(current_node.left, key)
    else
      return find_helper(current_node.right, key)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    inorder_helper(@root, [])
  end

  def inorder_helper(current_node, list)
    return list if current_node.nil?

    inorder_helper(current_node.left, list)
    list << { key: current_node.key, value: current_node.value}

    inorder_helper(current_node.right, list)

    return list
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    preorder_helper(@root, [])
  end

  def preorder_helper(current_node, list)
    return list if current_node.nil?

    list << { key: current_node.key, value: current_node.value}

    preorder_helper(current_node.left, list)
  
    preorder_helper(current_node.right, list)

    return list
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    postorder_helper(@root, [])
  end

  def postorder_helper(current_node, list)
    return list if current_node.nil?

    postorder_helper(current_node.left, list)

    postorder_helper(current_node.right, list)

    list << { key: current_node.key, value: current_node.value}

    return list
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(logn)
  def height
    return height_helper(@root, i = 0)
  end

  def height_helper(current_node, i = 0)
    return i if current_node.nil?

    left = height_helper(current_node.left, i + 1)

    right = height_helper(current_node.right, i + 1)

    return [left, right].max
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
