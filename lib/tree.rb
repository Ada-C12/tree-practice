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
  
  # Time Complexity: O(logn)
  # Space Complexity: O(logn) if tree is balanced and O(n) if it's not balanced.
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
    @root = add_helper(@root, key, value)
  end
  
  # Time Complexity: O(logn)
  # Space Complexity: O(logn) if tree is balanced and O(n) if it's not balanced.
  def find_helper(current_node, key)
    return nil if current_node.nil?
    
    if key > current_node.key 
      current_node.right = find_helper(current_node.right, key)
    elsif key < current_node.key
      current_node.left = find_helper(current_node.left, key)
    else
      return current_node.value
    end
  end
  
  def find(key)
    return find_helper(@root, key)
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
    return pre_order_helper(@root, [])
  end
  
  def pre_order_helper(current_node, list)
    return list if current_node.nil? 
    
    list << {key: current_node.key, value: current_node.value}
    pre_order_helper(current_node.left, list)
    pre_order_helper(current_node.right, list)
    return list
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    return post_order_helper(@root, [])
  end
  
  def post_order_helper(current_node, list)
    return list if current_node.nil? 
    
    post_order_helper(current_node.left, list)
    post_order_helper(current_node.right, list)
    list << {key: current_node.key, value: current_node.value}
    return list
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(logn) if tree is balanced and O(n) if it's not balanced.
  def height_helper(current_node)
    return 0 if current_node.nil?
    
    if height_helper(current_node.right) > height_helper(current_node.left)
      return height_helper(current_node.right) + 1
    else
      return height_helper(current_node.left) + 1
    end
  end 
  
  def height
    return height_helper(@root)
  end
  
  # Optional Method
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def bfs
    list = []
    return list if @root.nil?
    queue = [@root]
    
    until queue.empty?
      current = queue.shift
      queue.push(current.left) unless current.left.nil?
      queue.push(current.right) unless current.right.nil?
      
      list << {key: current.key, value: current.value}
    end 
    return list
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def find_largest(current)
    current = current_root
    
    while current.right
      current = current.right
    end 
    return current 
  end 
  
  # def delete(key)  
  #   raise NotImplementedError
  # end 
  
  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
