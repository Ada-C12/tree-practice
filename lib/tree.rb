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
    # base case is when current node is nil
    return TreeNode.new(key, value) if current_node.nil?

    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
    return current_node
  end

  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)
    # recursive solution with helper method
    @root = add_helper(@root, key, value)

    # the while-looping way
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
  end

  def find_helper(current_node, key)
    return nil if current_node.nil?
    return current_node.value if current_node.key == key

    if key < current_node.key
      find_helper(current_node.left, key)
    else
      find_helper(current_node.right, key)
    end
  end

  # Time Complexity: O(logn) where n is the number of nodes
  # Space Complexity: O(logn) where n is the number of nodes
  def find(key)
    return find_helper(@root, key)
  end

  def inorder_helper(current_node, list)
    return list if current_node.nil?

    inorder_helper(current_node.left, list)
    list << { key: current_node.key, value: current_node.value }
    inorder_helper(current_node.right, list)
    return list
  end
  # Time Complexity: 
  # Space Complexity: 
  def inorder
    # left -> current node -> right
    return inorder_helper(@root, [])
  end

  def preorder_helper(current_node, list = [])
    # root -> left -> right
    return list if current_node.nil?
    list << { key: current_node.key, value: current_node.value }
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
    return list
  end

  # Time Complexity: O(logn) where n is the number of nodes
  # Space Complexity: O(logn) where n is the number of nodes
  def preorder
    return preorder_helper(@root)
  end

  def postorder_helper(current_node, list = [])
    return list if current_node.nil?
    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << { key: current_node.key, value: current_node.value }
    return list
  end

  # Time Complexity: O(logn) where n is the number of nodes
  # Space Complexity: O(logn) where n is the number of nodes
  def postorder
    # left -> right -> root
    return postorder_helper(@root)
  end

  def height_helper(current_node, max, count)
    return max if current_node.nil?

    if count > max
      max = count
    end

    height_helper(current_node.left, max, count + 1)
    height_helper(current_node.right, max, count + 1)
  end

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n) where n is the number of nodes
  def height
    return 0 if @root.nil?
    return height_helper(@root, 0, 1)
  end

  # class version
  # def height_helper(current)
  #   return 0 if current.nil?
  #   left_height = height_helper(current.left)
  #   right_height = height_helper(current.right)

  #   # returns the height of the bigger of the two subtrees
  #   return [left_height, right_height].max + 1
    
  # end

  # def height
  #   return height_helper(@root)
  # end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    # this is 'really' a traversal, but this type of search is similar to what we'll be doing with graphs and it's called 'breadth first search'
    list = []
    return list if @root.nil?
    queue = [@root]

    until queue.empty?
      # big O of shift is O(n)
      current = queue.shift
      # how to check if current has a left subtree?
      queue.push(current.left) unless current.left.nil?
      queue.push(current.right) unless current.right.nil?

      list << { key: current.key, value: current.value}
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def delete
    raise NotImplementedError
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end

  # Create a method which takes in an array of sorted students and generates a balanced Binary Search Tree.
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def create_tree_helper(tree, list, first = 0, last = list.length - 1)
    # base case
    if first == last
      tree.add(first)
      return
    elsif first > last
      return
    end

    middle_node = (last + first) / 2
    tree.add(list[middle_node])
    create_tree_helper(tree, list, first, middle_node - 1)
    create_tree_helper(tree, list, first, middle_node + 1)
  end

  def create_tree(list)
    tree = Tree.new

    create_tree_helper(tree, list)
    return tree
  end

  # Write a method which takes a TreeNode, called current_node as an argument and returns true if the tree with it's root at current_node is the root of a valid binary search tree and false if it is not.
  # Time Complexity: O(n)
  # Space Complexity: 
  def valid_tree(current_node)
    return true if current_node.nil?

    return false if current_node.left != nil && current_node.left.key > current_node.key

    return false if current_node.right != nil && current_node.right.key < current_node.key

    return valid_tree(current_node.right) && valid_tree(current_node.left)
  end
end

# Find middle node
# Make that a new node (add it)
# Make the left subtree of that new node with the left half of the array
# Make the right subtree of that new node with the right half of the array
