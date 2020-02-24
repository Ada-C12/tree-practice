class TreeNode
  attr_reader :key, :value #key(what your using to sort) #value(value in node)
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
  # def add(key, value)
  #   if @root.nil?
  #     @root = Node.new(key, value)
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
  #           return
  #         end
  #       end
  #     end
  #   end
  
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
    @root = add_helper(@root, key, value) #starts at root
  end
  
  
  
  
  def find_helper(current_node, key)
    return if current_node.nil?
    
    return current_node.value if current_node.key == key
    
    if key < current_node.key 
      find_helper(current_node.left, key)
    else 
      find_helper(current_node.right, key)
    end
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    find_helper(@root, key)
  end
  
  # 
  
  def inorder_helper(current_node, list)
    return list if current_node.nil?
    #get left subtree
    inorder_helper(current_node.left, list)
    list << { key: current_node.key, value: current_node.value }
    #get right subtree
    inorder_helper(current_node.right, list)
    return list
  end
  # Time Complexity: 
  # Space Complexity: 
  def inorder #return [] with order were given
    list = []
    return inorder_helper(@root, [])
  end
  
  # Root, Left, Right
  def preorder_helper(current_node, list)
    return list if current_node.nil?
    list << { key: current_node.key, value: current_node.value }
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
    return list
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def preorder
    list = []
    return preorder_helper(@root, [])
  end
  
  # 
  
  def postorder_helper(current_node, list)
    return list if current_node.nil?
    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << { key: current_node.key, value: current_node.value }
    return list
  end
  # Time Complexity: 
  # Space Complexity: 
  def postorder
    list = []  
    return postorder_helper(@root, list)
  end
  
  
  def height_helper(current_node)
    return 0 if current_node.nil?
    
    left = height_helper(current_node.left)
    right = height_helper(current_node.right)
    
    if left < right 
      return right + 1
    else
      return left + 1
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
