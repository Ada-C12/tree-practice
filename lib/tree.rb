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

  # Time Complexity: O(logn) 
  # Space Complexity: O(n)
  def add(key, value, current=@root)
    # if the root is nil, the tree is empty, add a new node as root
    return @root = TreeNode.new(key, value) unless @root

    if key < current.key
      return add(key, value, current.left) if current.left
      current.left = TreeNode.new(key, value)
    elsif key > current.key
      return add(key, value, current.right) if current.right
      current.right = TreeNode.new(key, value)
    end
  end

  # Time Complexity: O(logn) 
  # Space Complexity: O(n)
  def find(key, current=@root)
    return unless current

    return current.value if current.key == key
    return find(key, current.left) if key < current.key
    return find(key, current.right) if key > current.key
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder(current = @root, out = [])
    return out unless current
    
    inorder(current.left, out)
    out << { key: current.key, value: current.value }
    inorder(current.right, out)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder(current = @root, out = [])
    return out unless current

    out << { key: current.key, value: current.value }
    preorder(current.left, out)
    preorder(current.right, out)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder(current = @root, out = [])
    return out unless current

    postorder(current.left, out)
    postorder(current.right, out)
    out << { key: current.key, value: current.value }
  end

  # Time Complexity: O(n) 
  # Space Complexity: O(n)
  def height(current = @root, h = 0)
    return h unless current

    height_left = height(current.left, h + 1)
    height_right = height(current.right, h + 1)

    height_left > height_right ? height_left : height_right
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

