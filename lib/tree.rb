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

  def add_helper(curr_node, key, value)
    if curr_node.nil?
      return TreeNode.new(key, value)
    else
      if key < curr_node.key
        curr_node.left = add_helper(curr_node.left, key, value)
      else
        curr_node.right = add_helper(curr_node.right, key, value)
      end
    end

    return curr_node
  end

  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)    
    @root = add_helper(@root, key, value)
  end

  def find_helper(curr_node, key)
    if curr_node.nil?
      return nil
    end

    if curr_node.key == key
      return curr_node.value
    end

    if curr_node.key > key
      return find_helper(curr_node.left, key)
    elsif curr_node.key < key
      return find_helper(curr_node.right, key)
    end
    
    return nil
  end 

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return find_helper(@root, key)
  end

  def inorder_helper(current_node, list) 
    return list if current_node.nil? 

    inorder_helper(current_node.left, list)
    list << {key: current_node.key, value: current_node.value}

    inorder_helper(current_node.right, list)
    return list
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder(node,)
    list = []
    inorder_helper(@root, list)
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder_helper(current_node, list) 
    return list if current_node.nil? 
    list << {key: current_node.key, value: current_node.value}

    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)

    return list 
  end 

  def pre_order
    list = []
    return preorder_helper(@root, list)
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder_helper(current_node, list)
    return [] if current_node.nil?

    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << {key: current_node.key, value: current_node.value}
    return list
  end 

  def postorder
    list = []
    return postorder_helper(@root, list)
  end

  def height_helper(current_node)
    return 0 if current_node.nil? 

    left_height = height_helper(current_node.left)
    right_height = height_helper(current_node.right)

    if left_height > right_height
      return left_height + 1
    else
      return right_height + 1
    end 
  end 

  # Time Complexity: 
  # Space Complexity: 
  def height
    height = 0
    return height_helper(@root)
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
