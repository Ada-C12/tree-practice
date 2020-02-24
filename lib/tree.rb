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
  
  # Time Complexity: O(log(n))
  # Space Complexity: O(log(n))
  def find(key)
    curr = @root 
    until curr.nil?
      if curr.key > key
        curr = curr.left 
      elsif curr.key < key
        curr = curr.right 
      else
        return curr.value
      end
    end
    return nil
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    inorder_helper(@root, [])
  end
  
  def inorder_helper(curr, list)
    return list if curr.nil?
    inorder_helper(curr.left, list)
    list << {key: curr.key, value: curr.value}
    inorder_helper(curr.right, list)
    return list
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n) 
  def preorder
    preorder_helper(@root, [])
  end
  
  def preorder_helper(curr, list)
    return list if curr.nil?
    list << {key: curr.key, value: curr.value}
    preorder_helper(curr.left, list)
    preorder_helper(curr.right, list)
    return list
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    postorder_helper(@root, [])
  end
  
  def postorder_helper(curr, list)
    return list if curr.nil?
    postorder_helper(curr.left, list)
    postorder_helper(curr.right, list)
    list << {key: curr.key, value: curr.value}
    return list
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(logn)
  def height
    height_helper(@root, 0)
  end
  
  def height_helper(curr, height)
    return height if curr.nil?
    l = height_helper(curr.left, height + 1)
    r = height_helper(curr.right, height + 1)
    return [l, r].max
  end
  
  # Optional Method
  # Time Complexity: O(log(n))
  # Space Complexity: O(log(n))
  def delete(value)
    delete_helper(@root, value)
  end
  
  def delete_helper(current_node, value)
    return if current_node.nil?
    if current_node.key > value
      current_node.left = delete_helper(current_node.left, value)
    elsif current_node.key < value
      current_node.right = delete_helper(current_node.right, value)
    else
      return nil
    end
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def bfs
    return [] if @root.nil?
    curr = @root
    queue = [curr]
    ind = 0
    until ind == queue.length
      curr = queue[ind]
      queue << curr.left if !curr.left.nil?
      queue << curr.right if !curr.right.nil?
      ind += 1
    end
    res = []
    queue.each do |node|
      res << {key: node.key, value: node.value}
    end
    return res
  end
  
  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
