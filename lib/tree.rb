class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

   def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
   end

   def add(key, value)


      if key <= @key
        return @left = TreeNode.new(key, value) if @left.nil?
        @left.add(key, value)
      else
        return @right = TreeNode.new(key, value) if @right.nil?
        @right.add(key, value)
      end

    end

    def find(key)

      return @value if @key == key

      if key > @key
        return nil if @right.nil?
        @right.find(key)
      else
        return nil if @left.nil?
        @left.find(key)
      end

    end

  def inorder

    inorder_array = []

    inorder_array += @left.inorder unless @left.nil?
    inorder_array << { key: @key, value: @value }
    inorder_array += @right.inorder unless @right.nil?
    
    return inorder_array

  end

  def preorder

    preorder_array = []

    preorder_array << { key: @key, value: @value }
    preorder_array += @left.preorder unless left.nil?
    preorder_array += @right.preorder unless right.nil?
    

    return preorder_array

  end

  def postorder

    postorder_array = []

    postorder_array += @left.postorder unless left.nil?
    postorder_array += @right.postorder unless right.nil?
    postorder_array << { key: @key, value: @value }

    return postorder_array
    
  end

  def height

    return 1 if @left.nil? && @right.nil?

    if @left.nil?
      @right.height + 1 
    elsif @right.nil?
      @left.height + 1
    else
      if @left.height >= @right.height
        @left.height + 1 
      else
        @right.height + 1 
      end
    end

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
    
    if @root.nil?
      return @root = TreeNode.new(key, value)
    end
    
    return @root.add(key, value)

  end


  # Time Complexity: O (log n)
  # Space Complexity: O(1)
  def find(key)
  
    return nil if @root.nil?
    return @root.find(key)

  end

#   # Time Complexity: O(n)
#   # Space Complexity: O(n)
  def inorder
    
    return [] if @root.nil?
    return @root.inorder

  end
  

#   # Time Complexity: O(n)
#   # Space Complexity: O(n)
  def preorder
    
    return [] if @root.nil?
    return @root.preorder

  end

#   # Time Complexity: O(n)
#   # Space Complexity: O(n)
  def postorder
    
    return [] if @root.nil?
    return @root.postorder

  end

#   # Time Complexity: 
#   # Space Complexity: 
  def height
      
    return 0 if @root.nil?
    return @root.height

  end

#   # Optional Method
#   # Time Complexity: 
#   # Space Complexity: 
#   def bfs
#     raise NotImplementedError
#   end

#   # Useful for printing
#   def to_s
#     return "#{self.inorder}"
#   end
end

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
        @root = TreeNode.new(key,value)
    else
      current = @root
      while true
          if key < current.key
            if !current.left.nil?
                current = current.left
            else
                current.left = TreeNode.new(key,value)
            end
          else
            if !@current.right.nil?
              current = current.right
            else
              current.right = TreeNode.new(key,value)
            end
          end
      end
    end
  end

  # Time Complexity: Because it's recursive I want to say O log(n)
  # Space Complexity: O log (n) if it's balanced, and I guess O(n) if it isn't
  def find(key)
    find_helper(@root, key)
  end

  def find_helper(current_node, key)
    return nil if current_node.nil?
    return current_node.value if current_node.key == key

    if key < current_node.key
        return find_helper(current_node.left, key)
    elsif
        key > current_node.key
        return find_helper(current_node.right, key)
    end
end


  # Time Complexity: I think time and space are both O(n)?
  # Space Complexity: 
  def inorder
    return inorder_helper(@root, [])
  end

  def inorder_helper(current_node, list)
    return list if current_node.nil?

    inorder_helper(current_node.left, list)
    list << {key: current_node.key, value: current_node.value}
    inorder_helper(current_node.right, list)

    return list
  end

  # Time Complexity: I feel like both are O(n) since each item has to be traversed, even if it's recursively?
  # Space Complexity: 
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(current_node, list)
    return list if current_node.nil?

    list << {key: current_node.key, value: current_node.value}

    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)

    return list
  end

  # Time Complexity: Same as above, O(n)?
  # Space Complexity: 
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(current_node, list)
    return list if current_node.nil?

    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)

    list << {key: current_node.key, value: current_node.value}

    return list

  end

  # Time Complexity: I'm not sure about time and space here. I think O(n)
  # Space Complexity: 
  def height
    return height_helper(@root, height = 0)
  end

  def height_helper(current_node, height)
    return height if current_node.nil?

    height += 1
    left_height = height_helper(current_node.left, height)
    right_height = height_helper(current_node.right, height)

    if left_height > right_height
        return left_height
    else 
        return right_height
    end
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
