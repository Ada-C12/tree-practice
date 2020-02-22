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
  # def add(key, value)
  
  #   temp = TreeNode.new(key, value)
  
  #   if @root == nil 
  #     @root = temp
  #     return
  #   end
  
  #   current = @root
  
  #   ####First attemp
  #   # until current == nil do
  #   #   if (current.left != nil) && (temp.key < current.left.key)
  #   #     if (temp.key > current.left.key && temp.key < current.right.key)
  #   #       current = current.left
  #   #     end
  #   #   elsif (current.right != nil) && (temp.key > current.right.key)
  #   #     current = current.right
  #   #   end
  #   # end
  
  
  #   ####Second attempt
  #   # until current.left == nil || current.right == nil do
  #   #   if temp.key < current && current.left != nil
  #   #     current = current.left
  #   #   elsif temp.key > current && current.right != nil
  #   #     current = current.right
  #   #   else
  #   #     return
  #   # end
  #   # temp = current
  
  #   # while true
  #   #   if temp.key < current.key
  #   #     if current.left != nil
  #   #       current = current.left
  #   #     else
  #   #       current.left = temp
  #   #       return
  #   #     end
  #   #   elsif
  #   #     if current.right != nil
  #   #       current = current.right
  #   #     else
  #   #       current.right = temp
  #   #       return
  #   #     end
  #   #   else
  #   #     return
  #   #   end
  #   # end
  
  #   # for recursion
  
  # end
  
  # Recursive way to do addition method
  def add(key, value)
    current = @root
    temp = TreeNode.new(key, value)
    if @root == nil
      @root = temp
      return
    else
      add_helper(@root, key, temp)
    end
  end
  
  def add_helper(current_node, key, temp)
    temp = temp
    if current_node == nil
      return temp
    end
    
    if key < current_node.key 
      current_node.left = add_helper(current_node.left, key, temp)
    else
      current_node.right = add_helper(current_node.left, key, temp)
    end
    return current_node
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    current = @root
    if current == nil
      return nil
    elsif current.key == key
      return current.value
    else
      find_helper(current, key)
    end
  end
  
  def find_helper (current, key) 
    if current.key == key
      return current.value
    elsif current.key > key && current.left != nil 
      find_helper(current.left, key)
    elsif current.key > key
      return nil
    elsif current.key < key && current.right != nil
      find_helper(current.right, key)
    elsif current.key < key
      return nil
    end
  end
  
  
  
  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return inorder_helper(@root, [])
  end
  
  def inorder_helper(current_node, list)
    
    return list if current_node.nil? # this is the thing that will cause the recursion to cascade back
    
    inorder_helper(current_node.left, list)
    list << {key: current_node.key, value: current_node.value}
    inorder_helper(current_node.right, list)
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
