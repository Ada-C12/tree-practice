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
  
  # Time Complexity: O(log n), assuming tree is balanced
  # Space Complexity: O(log n)
  def add_helper(current_node, key, value)
    return TreeNode.new(key, value) if current_node.nil?
    
    if key < current_node.key
      if current_node.left.nil?
        current_node.left = add_helper(current_node.left, key, value)
      else
        add_helper(current_node.left, key, value)
      end
    else
      if current_node.right.nil?
        current_node.right = add_helper(current_node.right, key, value)
      else
        add_helper(current_node.right, key, value)
      end
    end
    
  end
  
  def add(key, value)
    if @root.nil?
      @root = add_helper(@root, key, value)
    else
      add_helper(@root, key, value)
    end
  end
  
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find_helper(current_node, key)
    return nil if current_node.nil?
    return current_node.value if current_node.key == key
    key > current_node.key ? find_helper(current_node.right, key) : find_helper(current_node.left, key)
  end
  
  def find(key)
    return find_helper(@root, key)
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder_helper(current_node, list)
    return list if current_node.nil?
    
    inorder_helper(current_node.left, list)
    list << { key: current_node.key, value: current_node.value }
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
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height_helper(current_node, max_levels_count, levels_count)
    return max_levels_count if current_node.nil?
    
    levels_count += 1
    if levels_count > max_levels_count
      max_levels_count = levels_count
    end
    
    height_helper(current_node.left, max_levels_count, levels_count)
    height_helper(current_node.right, max_levels_count, levels_count)
  end
  
  def height
    height_helper(@root, 0, 0)    
  end
  
  # Optional Method
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def bfs_helper(current_node, list)
    return list if current_node.nil?
    
    # technically works
    # isn't great
    if current_node.left
      list << {key: current_node.left.key, value: current_node.left.value}
    end
    if current_node.right
      list << {key: current_node.right.key, value: current_node.right.value}
    end
    bfs_helper(current_node.left, list)
    bfs_helper(current_node.right, list)
  end
  
  def bfs
    if @root
      bfs_helper(@root, [{key: @root.key, value: @root.value}])
    else
      return []
    end
  end
  
  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
