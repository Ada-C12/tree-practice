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
    # RECURSIVE WAY 
      @root = add_helper(@root, key, value)

    # LOOP WAY
    # if @root.nil? 
    #   @root = TreeNode.new(key, value)
    # else 
    #   current = @root 
    #   while true 
    #     if key < current.key 
    #       if !current.left.nil? 
    #         current = current.left
    #       else 
    #         current.left = TreeNode.new(key, value)
    #       end 
    #     else 
    #       if !current.right.nil? 
    #         current = current.right
    #       else 
    #         current.right = TreeNode.new(key, value)
    #       end 
    #     end 
    #   end 
    # end 
  end

  # helper method for add() recursive way 
  def add_helper(current_node, key, value)
    return TreeNode.new(key, value) if current_node.nil? 

    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else 
      current_node.right = add_helper(current_node.right, key, value)
    end 

    return current_node
  end 


  # Time Complexity: o(log n)
  # Space Complexity: 0(n)
  def find(key)
    find_helper(@root, key)
  end

  def find_helper(current_node, key)
    return nil if current_node.nil?

    if current_node.key == key
      return current_node.value 
    elsif key < current_node.key
      return find_helper(current_node.left, key)
    else 
      return find_helper(current_node.right, key)
    end 
    return current_node
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
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
  # Space Complexity: O(n)
  def postorder
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
  # Space Complexity: O(n)
  def height
    return height_helper(@root, height = 0)
  end

  def height_helper(current_node, height)
    return height if current_node.nil? 
    
    height += 1 
    left_height = height_helper(current_node.left, height)
    right_height = height_helper(current_node.right, height)

    if left_height > right_height
      return left_height
    else 
      return right_height
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
