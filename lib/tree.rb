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
  # Space Complexity: O(1), because we are adding one node at the time.
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  def add_helper(root, key, value)
    if root.nil?
      root = TreeNode.new(key, value)
      return root
    end
  
    if root.key > key
      root.left = add_helper(root.left, key, value)
    else
      root.right = add_helper(root.right, key, value)
    end

    return root
  end

  # Time Complexity: O(log(n))
  # Space Complexity: O(log(n)), because of the stack
  def find(key)
    return find_helper(@root, key)
  end

  def find_helper(node, key)
    return nil if node.nil?

    if node.key == key
      return node.value
    elsif node.key > key
      return find_helper(node.left, key)
    else
      return find_helper(node.right, key)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n), if tree is not balanced (stack)
  def inorder
    result = []
    inorder_recursion(@root, result)
    return result
  end

  def inorder_recursion(node, result)
    return if node.nil?

    inorder_recursion(node.left, result)
    result.push({ :key => node.key, :value => node.value })
    inorder_recursion(node.right, result)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n) if tree is not balanced (stack)
  def preorder
    result = []
    preorder_recursion(@root, result)
    return result
  end

  def preorder_recursion(node, result)
    return if node.nil?

    result.push({ :key => node.key, :value => node.value })
    preorder_recursion(node.left, result)
    preorder_recursion(node.right, result)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n) if tree is not balanced (stack)
  def postorder
    result = []
    postorder_recursion(@root, result)
    return result
  end

  def postorder_recursion(node, result)
    return if node.nil?

    postorder_recursion(node.left, result)
    postorder_recursion(node.right, result)
    result.push({ :key => node.key, :value => node.value })
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n) if tree is not balanced (stack)
  def height
    return get_depth(@root, 0)
  end

  def get_depth(node, depth)
    return depth if node.nil?
    
    return [get_depth(node.left, depth + 1), get_depth(node.right, depth + 1)].max
end  

  # Optional Method
  # Time Complexity: O(n)
  # Space Complexity: O(n) (result array)
  def bfs
    return bfs_helper(@root)
  end

  def bfs_helper(node)
    result = []
    queue = Queue.new()
    queue.enq(node)

    while !queue.empty?
      curr = queue.deq()

      next if curr.nil?

      result.push({:key => curr.key, :value => curr.value})
      queue.enq(curr.left)
      queue.enq(curr.right)
    end

    return result
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
