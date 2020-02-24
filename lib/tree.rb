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
  
  # Time Complexity: Average O(log n), worst-case O(n)
  # Space Complexity: 1
  def add(key, value)
    @root = add_helper(@root, key, value)
  end
  
  def add_helper(curr_node, key, value)
    if curr_node.nil?
      return TreeNode.new(key, value) 
    end 
    if key <= curr_node.key
      curr_node.left = add_helper(curr_node.left, key, value)
    else 
      curr_node.right = add_helper(curr_node.right, key, value)
    end
    return curr_node
  end
  
  # Time Complexity: Average O(log n), worst-case O(n)
  # Space Complexity: 1
  def find(key)
    find_helper(@root, key)
  end
  
  def find_helper(curr_node, key)
    return if curr_node.nil?
    if key == curr_node.key
      return curr_node.value
    elsif key < curr_node.key
      find_helper(curr_node.left, key)
    else 
      find_helper(curr_node.right, key)
    end
  end 
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    return inorder_helper(@root, [])
  end
  
  def inorder_helper(curr_node, list)
    return list if curr_node.nil?
    inorder_helper(curr_node.left, list)
    list << {key: curr_node.key, value: curr_node.value}
    inorder_helper(curr_node.right, list)
    return list
  end 
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    return preorder_helper(@root, [])
  end
  
  def preorder_helper(curr_node, list)
    return list if curr_node.nil?
    list << {key: curr_node.key, value: curr_node.value}
    preorder_helper(curr_node.left, list)
    preorder_helper(curr_node.right, list)
  end 
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    return postorder_helper(@root, [])
  end
  
  def postorder_helper(curr_node, list)
    return list if curr_node.nil?
    postorder_helper(curr_node.left, list)
    postorder_helper(curr_node.right, list)
    list << {key: curr_node.key, value: curr_node.value}
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)...?
  def height
    return 0 if @root.nil?
    return [height_helper(@root.left), height_helper(@root.right)].max + 1
  end
  
  def height_helper(node)
    return 0 if node.nil?
    return 1 + [height_helper(node.left), height_helper(node.right)].max
  end 
  
  # Optional Method
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def bfs
    return [] if @root.nil?
    queue = []
    list = []
    queue.push(@root)
    while queue.length > 0
      curr_node = queue[0]
      list << {key: curr_node.key, value: curr_node.value}
      queue.push(curr_node.left) if curr_node.left
      queue.push(curr_node.right) if curr_node.right
      queue.shift
    end
    return list 
  end
  
  # Time Complexity: Average O(log n), worst case O(n)
  # Space Complexity: O(1)
  # Not happy with the time efficiency of this solution, but I couldn't find a way to merge search and assigning more effectively than just calling find from within delete.

  def delete(key)
    if find(key)
      @root = delete_helper(@root, key)
    else
      return nil
    end 
  end 
  
  def delete_helper(curr_node, key)
    return nil if curr_node.nil?
    if key < curr_node.key
      curr_node.left = delete_helper(curr_node.left, key)
    elsif key > curr_node.key
      curr_node.right = delete_helper(curr_node.right, key)
    else #found a match
      if curr_node.left.nil? && curr_node.right.nil? 
        return 
      elsif curr_node.left.nil?
        return curr_node.right
      elsif curr_node.right.nil?
        return curr_node.left
      else
        temp = curr_node.right
        while temp.left
          temp = temp.left
        end 
        curr_node = temp
        curr_node.right = delete_helper(curr_node.right, temp.key)
      end 
    end 
  end 
  
  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
