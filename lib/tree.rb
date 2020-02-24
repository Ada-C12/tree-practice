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

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
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


  # Time Complexity: O(log n) where n is number of nodes in tree
  # Space Complexity: O(log n) where n is number of nodes in tree
  def find_helper(current_node, search)
    return nil if current_node.nil?
    
    if current_node.key == search
      return current_node.value
    elsif current_node.key > search
      find_helper(current_node.left, search)
    else
      find_helper(current_node.right, search)
    end
  end
  
  def find(key)
    return find_helper(@root, key)
  end

  # Time Complexity: O(n) where n is number of nodes in tree
  # Space Complexity: O(n) where n is number of nodes in tree
  # return array of all nodes in order
  # when? if you need to print all the nodes of a tree in order 
  def inorder_helper(current_node, list)
    return list if current_node.nil?

    inorder_helper(current_node.left, list) if current_node.left
    list << {key: current_node.key, value: current_node.value}
    inorder_helper(current_node.right, list) if current_node.right
    
    return list
  end

  def inorder
    return inorder_helper(@root, [])
  end

  # Time Complexity: O(n) where n is number of nodes in tree
  # Space Complexity: O(n) where n is number of nodes in tree
  # when? if you need to save a tree data structure to disk, or send it across the network and maintain the structure
  def preorder_helper(current_node, list)
    return list if current_node.nil?

    list << {key: current_node.key, value: current_node.value}
    preorder_helper(current_node.left, list) if current_node.left
    preorder_helper(current_node.right, list) if current_node.right
    
    return list
  end
  
  def preorder
    return preorder_helper(@root, [])
  end

  # Time Complexity: O(n) where n is number of nodes in tree
  # Space Complexity: O(n) where n is number of nodes in tree
  # when? if you need to delete all the nodes in BST
  def postorder_helper(current_node, list)
    return list if current_node.nil?

    postorder_helper(current_node.left, list) if current_node.left
    postorder_helper(current_node.right, list) if current_node.right
    list << {key: current_node.key, value: current_node.value}
    
    return list
  end

  def postorder
    return postorder_helper(@root, [])
  end

  # Time Complexity: O(n) where n is number of nodes in tree
  # Space Complexity: O(n) where n is number of nodes in tree
  def height_helper(current_node, count, max)
    return max if current_node.nil?

    max = count if count > max
    height_helper(current_node.left, count + 1, max)
    height_helper(current_node.right, count + 1, max)
  end
  
  def height
    return height_helper(@root, 1, 0)
  end

  # Optional Method
  # Time Complexity: O(n) where n is number of nodes in tree
  # Space Complexity: O(n) where n is number of nodes in tree
  def bfs_helper(node, list, level)
    return list if node.nil?
    
    # creating array of arrays for each level in tree
    list[level] = [] if list[level].nil?
    list[level] << {key: node.key, value: node.value}

    bfs_helper(node.left, list, level + 1)
    bfs_helper(node.right, list, level + 1)
  end
  
  def bfs
    return (bfs_helper(root, [], 0)).flatten
  end

  

  def find_previous_node(current_node, previous_node, search)
    # return nil if current_node.nil?
    
    # if current_node.key == search
    #   return previous_node
    # elsif current_node.key > search
    #   find_helper(current_node.left, current_node, search)
    # else
    #   find_helper(current_node.right, current_node, search)
    # end
  end

  def delete_helper(previous_node, node)
    # if node.left.nil? && node.right.nil?
    #   if previous_node.left == node 
    #     previous_node.left = nil
    #   else
    #     previous_node.right = nil
    #   end
    # elsif previous_node.left.nil? || previous_node.right.nil?
    #   if previous_node.left == node 
    #     previous_node.left = node.left
    #   else
    #     previous_node.right = node.right
    #   end
    # else
    #   current = node.right
    #   until current.nil? do
        
    #   end
    
    # end
  end

  def delete(key)
    # previous_node = find_previous_node(@root, nil, key)
    # if previous_node.nil?  
    #   return nil
    # elsif previous_node.right == key
    #   delete_node = previous_node.right
    # else
    #   delete_node = previous_node.left
    # end
    # delete_helper(previous_node, delete_node)
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
