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
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  # recursive helper method 
  def add_helper(current_node, key, value)
    #  base case 
    return TreeNode.new(key, value) if current_node.nil?
    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else 
      current_node.right = add_helper(current_node.right, key, value)
    end
    return current_node
    
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def find(key)
    # raise NotImplementedError
    current = @root
    return nil if current.nil?
    return find_helper(root, key)
  end

  def find_helper(current_node, key)
    return current_node.value if current_node.key == key

    if key <= current_node.key
      current_node.left = find_helper(current_node.left, key)
    else
      current_node.right = find_helper(current_node.right, key)
    end

  end



  def inorder_helper(current_node, list)
    return list if current_node.nil? 

    inorder_helper(current_node.left, list)
    list << { key: current_node.key, value: current_node.value }
    inorder_helper(current_node.right, list)
    return list 
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def inorder
    return inorder_helper(@root, [])
  end

  # Time Complexity: O(n) call visit on each node exactly once
  # Space Complexity: 
  # current node, left subtree, right subtree
    # 1. visit node
    # 2. traverse left subtree
    # 3. traverse right subtree
  def preorder
    return preorder_helper(@root, [])

  end

  def preorder_helper(current_node, list)
    return list if current_node.nil?
    list <<  { key: current_node.key, value: current_node.value}
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
  end

  # Time Complexity: O(n), one call made per visit on each node
  # Space Complexity: O(n) - where n refers to the stack
  # left right current
  def postorder
    # raise NotImplementedError
    return postorder_helper(@root, [])
  end

  def postorder_helper(current_node, list)
    return list if current_node.nil?  
    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << { key: current_node.key, value: current_node.value}
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def height
    return height_helper(@root, 0)
    # If the current node is nil return 0
    # Otherwise return 1 plus the maximum of the heights of the right and left subtrees
  end

  def height_helper(current_node, height)
    return height if current_node.nil?
    height_helper(current_node.left, height + 1)
    height_helper(current_node.right, height + 1)
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  # all leaves then all parents up to root
  # def bfs
  #   # raise NotImplementedError?
  #   return bfs_helper(@root, [])
  # end

  # def bfs_helper(current_node, list)
  #   visited = {}
  
  #   return list if current_node.nil? 
  #   q = new Queue
  #   q.push(current_node)
  #   while(!q.empty?)
  #     node_to_record = q.pop
  #     list << {key: node_to_record.key, value: node_to_record.value}
  #     if 
  #   end


    # visited[current_node] = true
    # list << { key: current_node.key, value: current_node.value}
    # if current_node.left
    #   left = current_node.left 
    #   list << { key: left.key, value: left.value}
      
    # end
    # if current_node.right
    #   right = current_node.right if current_node.right
    #   list << { key: right.key, value: right.value}
    # end
    
    # // go down a level
    # bfs_helper(current_node.left, list)
    # bfs_helper(current_node.right, list)
  #   bfs_helper(current_node.left, list)
    
  # end



  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end