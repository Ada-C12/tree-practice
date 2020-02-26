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
    if @root.nil?
      @root = TreeNode.new(key, value)
    else
      add_helper(@root, key, value)
    end
  end

  def add_helper(current, key, value)
    if current.nil?
      return TreeNode.new(key, value)
    else
      if key < current.key
        current.left = add_helper(current.left, key, value)
      else
        current.right = add_helper(current.right, key, value)
      end
    end

    return current
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    if @root.nil?
      return nil
    else
      return find_helper(@root, key)
    end
  end

  def find_helper(current, key)
    if current.key == key
      return current.value
    end

    if key < current.key
      find_helper(current.left, key)
    else
      find_helper(current.right, key)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return inorder_helper(@root, [])  
  end

  def inorder_helper(current, nodes_array)
    unless current.nil?
      inorder_helper(current.left, nodes_array)
      nodes_array << { key: current.key, value: current.value }
      inorder_helper(current.right, nodes_array)
    end

    return nodes_array
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(current, nodes_array)
    unless current.nil?
      nodes_array << { key: current.key, value: current.value }
      preorder_helper(current.left, nodes_array)
      preorder_helper(current.right, nodes_array)
    end

    return nodes_array
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(current, nodes_array)
    unless current.nil?
      postorder_helper(current.left, nodes_array)
      postorder_helper(current.right, nodes_array)
      nodes_array << { key: current.key, value: current.value }
    end

    return nodes_array
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    return 0 if @root.nil?

    return height_helper(@root)
  end

  def height_helper(current)
    return 0 if current.nil?

    left = 1 + height_helper(current.left)
    right = 1 + height_helper(current.right)

    return [left, right].max
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    nodes_array = []
    
    unless @root.nil?
      nodes_array << { key: @root.key, value: @root.value}
    end

    return bfs_helper(@root, nodes_array)
  end

  def bfs_helper(current, nodes_array)
    return nodes_array if current.nil?
      
    nodes_array << { key: current.left.key, value: current.left.value } if current.left
    nodes_array << { key: current.right.key, value: current.right.value } if current.right

    bfs_helper(current.left, nodes_array)
    bfs_helper(current.right, nodes_array)

    return nodes_array
  end


  # couldn't get this to work in time :(
  def delete(key)
    return nil if @root.nil?

    # do something if root is the node to be deleted


    to_delete = find_node(@root, key)
    parent_node = find_parent(@root, nil, key)

    if to_delete.left && to_delete.right
      find_replacement(@root, to_delete.key)
    elsif to_delete.left
      if parent_node.right == to_delete
        parent_node.right = to_delete.left
      elsif parent_node.left == to_delete
        parent_node.left = to_delete.left
      end
      return
    elsif to_delete.right
      if parent_node.right == to_delete
        parent_node.right = to_delete.right
      elsif parent_node.left == to_delete
        parent_node.left = to_delete.right
      end
      return
    else
      parent_node.left = nil
      parent_node.right = nil
      return
    end
  end

  def find_node(current, key)
    return current if current.key == key

    if key < current.key
      find_node(current.left, key)
    else
      find_node(current.right, key)
    end
  end

  def find_parent(current, parent, key)
    return parent if current.key == key

    if key < current.key
      find_parent(current.left, current, key)
    else
      find_parent(current.right, current, key)
    end
  end

  def find_replacement(current, to_delete_key, closest_lower_node = nil)
    return closest_lower_node if current.nil?
  end
  

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
