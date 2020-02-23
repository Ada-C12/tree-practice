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
  def add_while(key, value)
    newNode = TreeNode.new(key, value)

    if root.nil?
      @root = newNode
    
    else 
      # need to find the rightful place for this newNode
      curr = root

      while curr 
        if newNode.key <= curr.key 
          # send to left of curr
          if curr.left
            # curr.left already exists, so set new curr to that node, and continue the while loop
            curr = curr.left
          else
            # empty spot, newNode can go there
            curr.left = newNode
            return
          end

        else
          # send to right of curr
          if curr.right
            curr = curr.right 
          else  
            curr.right = newNode 
            return
          end
        end
      end
    end
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n) 
  def add(key, value)
    newNode = TreeNode.new(key, value)

    if root.nil?
      @root = newNode
    
    else 
      # need to find the rightful place for this newNode
      add_recursion_helper(root, newNode)
    end
  end

  def add_recursion_helper(currNode, newNode)
    
    if currNode.nil? 
      #  base case: nobody is on the currNode spot
      return newNode 

    else
      # recurse: until empty spot found for newNode
      if newNode.key <= currNode.key
        currNode.left = add_recursion_helper(currNode.left, newNode)
      else
        currNode.right = add_recursion_helper(currNode.right, newNode)
      end
    
      # since currNode already exists in this spot, needs to leave it intact
      return currNode
    end
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find(key)
    # if node with key exists, return that node's value, else return nil
    if root.nil?
      return nil
    else
      return find_recursion_helper(root, key)
    end
  end

  def find_recursion_helper(currNode, key)
    if currNode.nil?
      return nil
    else
      if key == currNode.key
        return currNode.value
      elsif  key < currNode.key
        return find_recursion_helper(currNode.left, key)
      else
        return find_recursion_helper(currNode.right, key)
      end
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(log n)
  def inorder 
    return inorder_helper(root, [])
  end

  def inorder_helper(currNode, list)

    if currNode.nil?
      # base case
      return list

    else
      # recurse
      # in order goes from left -> parent -> right
      inorder_helper(currNode.left, list)
    
      list << { key: currNode.key, value: currNode.value }

      inorder_helper(currNode.right, list)

      return list
    end

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
  def height
    raise NotImplementedError
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    raise NotImplementedError
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  # also need to add tests for this method
  def delete(value)
    # deletes just this node, leave children behind
    raise NotImplementedError
  end

  # Useful for printing
  def to_s
    # return "#{self.inorder}"
    puts "IN ORDER = #{self.inorder()}"
    puts "PRE ORDER = #{self.preorder()}"
    puts "POST ORDER = #{self.postorder()}"
  end

end
