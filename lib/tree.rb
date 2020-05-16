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

  # Time Complexity: O(log n)/ O(n)
  # Space Complexity: O(log n) for a balanced BST; O(n) for unbalanced BST
  def add_helper(curr, key, value)
    return TreeNode.new(key, value) if curr.nil?

    if key < curr.key
      curr.left = add_helper(curr.left, key, value)
    else
      curr.right = add_helper(curr.right, key, value)
    end

    return curr
  end

  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  # Time Complexity: O(log n)/O(n)
  # Space Complexity: O(1)
  def find(key)
    curr = @root

    until curr.nil?
      if key > curr.key
        curr = curr.right
      elsif key < curr.key
        curr = curr.left
      else
        return curr.value
      end
    end

    return nil
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder_helper(curr, list)
    return list if curr.nil?
    
    # inorder: left - root - right 
    inorder_helper(curr.left, list)
    list << {key: curr.key, value: curr.value}
    inorder_helper(curr.right, list)

    return list
  end
  
  def inorder
    return inorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder_helper(curr, list) 
    return list if curr.nil?

    # preorder: root - left - right 
    list << { key: curr.key, value: curr.value }
    preorder_helper(curr.left, list)
    preorder_helper(curr.right, list)

    return list
  end
  
  def preorder
    return preorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder_helper(curr, list)
    return list if curr.nil?

    # postorder: left - right - root
    postorder_helper(curr.left, list)
    postorder_helper(curr.right, list)
    list << { key: curr.key, value: curr.value }

    return list
  end

  def postorder
    return postorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(log n)/ O(n)
  def height_helper(curr, height)
    return height if curr.nil?
    
    height += 1
    left_height = height_helper(curr.left, height)
    right_height = height_helper(curr.right, height)

    return [left_height, right_height].max
  end

  def height
    return height_helper(@root, 0)
  end

  # Optional Method
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def bfs
    visted = []
    return visted if @root.nil?

    to_visit = [@root]
    until to_visit.empty?
      curr = to_visit.shift
      visted << {
        key: curr.key,
        value: curr.value
      }
      
      to_visit << curr.left if curr.left
      to_visit << curr.right if curr.right
    end

    return visted
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
