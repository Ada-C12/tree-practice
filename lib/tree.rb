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
  
  # Time Complexity: O(logn) in best case
  # Space Complexity: O(1)
  def add(key, value)
    current_and_parent_pair = find_current_and_parent_nodes(key)
    if current_and_parent_pair[:current]
      # update new value if key exists
      current_and_parent_pair[:current].value = value
    else
      new_node = TreeNode.new(key,value)
      parent = current_and_parent_pair[:parent]
      link_node_to_parent(parent, new_node)
    end
  end
  
  # IN CLASS PRACTICE: add() recursive
  # def add_helper(current_node, key, value)
  #   return TreeNode.new(key, value) if !current_node
  #   if current_node.key > key
  #     current_node.left = add_helper(current_node.left, key, value)
  #   else
  #     current_node.right = add_helper(current_node.right, key, value)
  #   end
  #   return current_node
  # end
  
  # def add(key, value)
  #   @root = add_helper(@root, key, value)
  # end
  
  # Time Complexity: O(logn) in best case
  # Space Complexity: O(1)
  def find(key)
    current_and_parent_pair = find_current_and_parent_nodes(key)
    if current_and_parent_pair[:current] 
      return current_and_parent_pair[:current].value
    else
      return nil
    end
  end
  
  # Time Complexity: O(n) with n is the number of nodes in the tree
  # Space Complexity: O(n)
  def inorder
    list = []
    stack = []
    
    current = @root
    while current
      stack << current 
      current = current.left
    end
    
    while !stack.empty?
      top = stack.pop
      list << {key: top.key, value: top.value}
      
      if top.right
        stack << top.right
        
        current = top.right.left
        while current
          stack << current
          current = current.left
        end 
      end
    end
    
    return list
  end
  
  # IN CLASS PRACTICE: inorder() recursive
  # def inorder_helper(current_node, list = [])
  #   return list if !current_node 
  #   inorder_helper(current_node.left, list)
  #   list << {key: current_node.key, value: current_node.value}
  #   inorder_helper(current_node.right, list)
  #   return list
  # end
  
  # def inorder
  #   return inorder_helper(@root)
  # end
  
  # Time Complexity: O(n) with n is the number of nodes in the tree
  # Space Complexity: O(n)
  def preorder_helper(current_node, list = [])
    return list if !current_node
    list << {key: current_node.key, value: current_node.value}
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
    return list
  end
  
  def preorder
    return preorder_helper(@root)
  end
  
  # Time Complexity: O(n) with n is the number of nodes in the tree
  # Space Complexity: O(n)
  def postorder_helper(current_node, list = [])
    return list if !current_node
    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << {key: current_node.key, value: current_node.value}
    return list
  end
  
  def postorder
    return postorder_helper(@root)
  end
  
  # Time Complexity: O(n) with n is the number of nodes in the tree
  # Space Complexity: O(logn) which is also the height of the tree.
  def height_helper(current_node, level = 0)
    return level if !current_node
    level = [height_helper(current_node.left, level + 1), height_helper(current_node.right, level + 1)].max
    return level
  end
  
  def height
    return height_helper(@root)
  end
  
  # Optional Method
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def bfs
    list = []
    if @root
      queue = []
      queue << @root
      queue.each do |current|
        list << {key: current.key, value: current.value}
        queue << current.left if current.left
        queue << current.right if current.right
      end
    end
    return list
  end
  
  def delete(key)
    current_and_parent_pair = find_current_and_parent_nodes(key)
    current = current_and_parent_pair[:current] 
    parent = current_and_parent_pair[:parent]
    # rearrange new subtree from children if current is not a leaf node, else remove leaf node
    if current 
      if !current.left && !current.right
        remove_leaf(parent, current)
      else
        left = current.left 
        right = current.right 
        right_subtree_leftmost = find_leftmost_node(right)
        right_subtree_leftmost.left = left if right_subtree_leftmost
        
        new_subtree = right_subtree_leftmost ? right : left
        link_node_to_parent(parent, new_subtree)
      end
    end
  end
  
  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
  
  private
  def find_current_and_parent_nodes(key)
    current = @root
    parent = nil
    
    while current
      if current.key == key
        return {current: current, parent: parent}
      elsif current.key > key
        parent = current
        current = current.left
      else
        parent = current
        current = current.right
      end
    end
    
    return {current: current, parent: parent}
  end
  
  def find_leftmost_node(current_node)
    leftmost = current_node
    while leftmost && leftmost.left
      leftmost = leftmost.left
    end
    return leftmost
  end
  
  def link_node_to_parent(parent, node)
    return if !node
    if !parent
      @root = node
    elsif parent.key > node.key
      parent.left = node
    else
      parent.right = node
    end
  end

  def remove_leaf(parent, leaf)
    if !parent
      @root = nil
    elsif parent && leaf
      if parent.value > leaf.value
        parent.left = nil
      else
        parent.right = nil
      end
    end
  end
end
