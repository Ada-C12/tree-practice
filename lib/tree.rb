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

  # Time Complexity: 
  # Space Complexity: 

  # the loop way
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
  #         end

  #       else
  #         if !current.right.nil?
  #           current = current.right
  #         else
  #           current.right = TreeNode.new(key, value)
  #         end

  #       end
  #     end
  #   end 
  # end

  # the recursive way
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  # recursive helper method
  def add_helper(current_node, key, value)

    # base case
    return TreeNode.new(key, value) if current_node.nil?

    # recursive cases
    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
  end

  # Time Complexity: worst case O(n) since the key may be the last node traversed
  # Space Complexity: O(n) since we have to keep track of previous operations until we hit a base case
  def find(key)

    current_node = @root

    return nil if current_node.nil?
    return current_node.value if current_node.key == key

    find_helper(current_node, key)

  end

  # find helper
  def find_helper(current_node, key)
    
    # base case
    return current_node.value if current_node.key == key

    # if key sought is lower than current_node.key, move to the left
    if key < current_node.key
      find_helper(current_node.left, key)
    # if key sought is higher or equal to than current_node.key, move to the right
    elsif key >= current_node.key
      find_helper(curent_node.right, key) 
    end

  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    list = []
    return inorder_helper(@root, list)
  end

  def inorder_helper(current_node, list)

    # base case
    return list if current_node.nil?

    # recursive cases
    inorder_helper(current_node.left, list)
    list << { key: current_node.key, value: current_node.value }
    inorder_helper(current_node.right, list)

    # existing code is only adding the last key/value pair 

    return list
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
end
