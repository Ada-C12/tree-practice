require 'awesome_print'

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
    puts "new root: #{key}" if @root.nil?
    return TreeNode.new(key, value) if current_node.nil?

    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
      puts "new left node: #{current_node.left.key}" if current_node.left
    else
      current_node.right = add_helper(current_node.right, key, value)
      puts "new right node: #{current_node.right.key}" if current_node.right
    end
  end
  
  def add(key, value)
    if @root
      add_helper(@root, key, value)
    else 
      @root = add_helper(@root, key, value)
    end
  end


  # Time Complexity: O(log n) where n is number of nodes in tree
  # Space Complexity: O(log n) where n is number of nodes in tree
  def find_helper(current_node, search)
    return nil if current_node.nil?
    
    if current_node.key == search
      return current_node.value
    elsif current_node.key > search
      current_node = find_helper(current_node.left, search)
    elsif current_node.key < search
      current_node = find_helper(current_node.right, search)
    end
  end
  
  def find(key)
    return nil if @root.nil?
    return find_helper(@root, key)
  end

  # Time Complexity: O(n) where n is number of nodes in tree
  # Space Complexity: O(n) where n is number of nodes in tree
  # return array of all nodes in order 
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
  
  def height_helper
    return 0 
  end
  
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
