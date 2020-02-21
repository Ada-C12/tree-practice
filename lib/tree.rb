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
  def add(key, value)
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
    #         return
    #       end
    #     else
    #       if !current.right.nil?
    #         current = current.right
    #       else
    #         current.right = TreeNode.new(key, value)
    #         return
    #       end
    #     end
    #   end
    # end
    
    @root = add_helper(key, value, @root)
    return @root
  end
  
  def add_helper(key, value, current)
    if current.nil?
      return TreeNode.new(key, value)
    end
    
    if key <= current.key
      current.left = add_helper(key, value, current.left)
    else
      current.right = add_helper(key, value, current.right)
    end
    
    return current
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    current = @root
    
    until current.nil?
      if current.key == key
        return current.value
      elsif key < current.key
        current = current.left
      else
        current = current.right
      end
    end
    
    return nil
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def inorder
    # return an array
    inorder_helper(@root, [])
  end
  
  def inorder_helper(current, list)
    return list if current.nil?
    
    # we're passing by reference, so we don't have to set list = inorder_helper calls
    # left - root - right
    inorder_helper(current.left, list)
    list << { key: current.key, value: current.value }
    inorder_helper(current.right, list)
    
    return list
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def preorder
    preorder_helper(@root, [])
  end
  
  def preorder_helper(current, list)
    return list if current.nil?
    
    # root - left - right
    list << { key: current.key, value: current.value }
    
    preorder_helper(current.left, list)
    preorder_helper(current.right, list)
    
    return list
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def postorder
    postorder_helper(@root, [])
  end
  
  def postorder_helper(current, list)
    return list if current.nil?
    
    # left-right-root
    postorder_helper(current.left, list)
    postorder_helper(current.right, list)
    list << { key: current.key, value: current.value }
    
    return list
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def height
    height_helper(@root, 0)
  end
  
  def height_helper(current, count)
    return count if current.nil?
    
    count += 1
    
    count_left = height_helper(current.left, count)
    count_right = height_helper(current.right, count)
    
    return (count_left >= count_right) ? count_left : count_right
  end
  
  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    return [] if @root.nil?
    
    result = bfs_helper(@root, [], 1)
    
    return result.compact!
  end
  
  def bfs_helper(current, list, k)
    return list if current.nil?
    
    list[k] = { key: current.key, value: current.value }
    
    bfs_helper(current.left, list, (2*k))
    bfs_helper(current.right, list, (2*k+1))
    
    return list
  end
  
  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
