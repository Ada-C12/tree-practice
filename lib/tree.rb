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
  
  def add_helper(current_node, key, value)
    return TreeNode.new(key, value) if current_node.nil?
    
    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
    
    return current_node
  end
  
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def add(key, value)
    @root = add_helper(@root, key, value)
  end
  
  def find_helper(current_node, target)
    return current_node if current_node == nil
    return current_node.value if current_node.key == target
    
    if target < current_node.key
      find_helper(current_node.left, target)
    else
      find_helper(current_node.right, target)
    end
    
  end
  
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
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
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    return inorder_helper(@root, [])
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
  def preorder
    return preorder_helper(@root, [])
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
  def postorder
    return postorder_helper(@root, [])
  end
  
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  
  def height_helper(current_node)
    return 0 if current_node.nil?
    
    left = height_helper(current_node.left)
    right = height_helper(current_node.right)
    
    if left > right
      return left += 1
    else
      return right += 1
    end
  end
  
  def height
    return 0 if @root.nil?
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

tree = Tree.new
tree.add(1, "Brianna")
tree.add(2, "Brianna")
tree.add(3, "Brianna")
# p tree

# p tree.inorder
p tree.find(2)
p tree.find(3)