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
  
  # Time Complexity: O(log(n))
  # Space Complexity: O(log(n))
  
  # the loop way
  # def add(key, value)
  #   if @root.nil?
  #     @root = TreeNode.new(key, value)
  #     return
  #   else
  #     current = @root
  #     while true
  #       if key <= current.key
  #         if !current.left.nil?
  #           current = current.left
  #         else
  #           current.left = TreeNode.new(key, value)
  #           return
  #         end
  #       else
  #         if key > current.key
  #           if !current.right.nil?
  #             current = current.right
  #           else
  #             current.right = TreeNode.new(key, value)
  #             return
  #           end
  #         end
  #       end
  #     end
  #   end
  # end
  
  # the recursive way
  def add_helper(current_node, key, value)
    return TreeNode.new(key, value) if current_node.nil?
    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
    return current_node
  end
  
  def add(key, value)
    if @root.nil?
      @root = TreeNode.new(key, value)
    else
      add_helper(@root, key, value)
    end
  end
  
  # Time Complexity: O(log(n))
  # Space Complexity: O(log(n))
  def find_helper(current_node, key)
    return nil if current_node.nil?
    return current_node.value if current_node.key == key
    if key < current_node.key
      find_helper(current_node.left, key)
    else
      find_helper(current_node.right, key)
    end
    # return current_node
  end
  
  def find(key)
    find_helper(@root, key)
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder_helper(current_node, list)
    return list if current_node.nil?
    inorder_helper(current_node.left, list)
    list << {key: current_node.key, value: current_node.value}
    inorder_helper(current_node.right, list)
  end
  
  def inorder
    inorder_helper(@root, [])
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder_helper(current_node, list)
    return list if current_node.nil?
    list << {key: current_node.key, value: current_node.value}
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
  end
  
  def preorder
    preorder_helper(@root, [])
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder_helper(current_node, list)
    return list if current_node.nil?
    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << {key: current_node.key, value: current_node.value}
  end
  
  def postorder
    postorder_helper(@root, [])
  end
  
  # Time Complexity:
  # Space Complexity:
  def measuring_stick(current_node, height)
  end
  def height
    return 0 if @root.nil?
    measuring_stick(@root, 1)
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
