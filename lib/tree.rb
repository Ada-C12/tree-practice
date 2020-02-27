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
  # attr_reader :root
  attr_accessor :root   # i had to do it this way to allow delete() to work
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
  # Space Complexity: O(log n) assuming a balanced tree, else O(n)
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
  # Space Complexity: O(log n) assuming a balanced tree, else O(n)
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
  # Space Complexity: O(n) b/c i'm building an []
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

  # Time Complexity: O(n)
  # Space Complexity: O(n) b/c i'm building an []
  def preorder
    return preorder_helper(root, [])
  end

  def preorder_helper(currNode, list)

    if currNode.nil?
      # base case
      return list

    else
      # recurse
      # preorder goes from parent -> left -> right
      list << { key: currNode.key, value: currNode.value }

      preorder_helper(currNode.left, list)
    
      preorder_helper(currNode.right, list)

      return list
    end

  end

  # Time Complexity: O(n)
  # Space Complexity: O(n) b/c i'm building an []
  def postorder
    return postorder_helper(root, [])
  end

  def postorder_helper(currNode, list)

    if currNode.nil?
      # base case
      return list

    else
      # recurse
      # postorder goes from left -> right -> parent

      postorder_helper(currNode.left, list)
    
      postorder_helper(currNode.right, list)

      list << { key: currNode.key, value: currNode.value }

      return list
    end

  end

  # Time Complexity: O(n)
  # Space Complexity: O(log n) assuming a balanced tree, else O(n)
  def height
    return subtree_height(root)
  end

  def subtree_height(currNode)
    if currNode.nil?
      return 0
    else
      if !currNode.left && !currNode.right
        return 1
      else
        # set initial conditions for the subtrees  
        leftHeight = 0
        rightHeight = 0

        if currNode.left 
          leftHeight = 1 + subtree_height(currNode.left)
        end
        
        if currNode.right
          rightHeight = 1 + subtree_height(currNode.right)
        end 

        if leftHeight >= rightHeight 
          return leftHeight
        else
          return rightHeight
        end
      end
      
    end
  end

  # Optional Method
  # Time Complexity: O(n)
  # Space Complexity: O(n) b/c i'm building an []
  def bfs
    return [] if !root

    listOfNodes = [root]
    answer = [{key: root.key, value: root.value} ]
    currIndex = 0

    while listOfNodes[currIndex]
      puts "\nlist is currenty... "
      printNodesInList(listOfNodes)

      currNode = listOfNodes[currIndex]
      puts "looking at listOfNodes: #{listOfNodes}"
      if currNode.left
        listOfNodes << currNode.left 
        answer << {key: currNode.left.key, value: currNode.left.value} 
      end
      if currNode.right
        listOfNodes << currNode.right
        answer << {key: currNode.right.key, value: currNode.right.value} 
      end
      currIndex += 1
    end
    
    return answer
  end

  def printNodesInList(list)
    currIndex = 0
    while list[currIndex]
      puts "\t#{list[currIndex].key}/#{list[currIndex].value}"
      currIndex += 1
    end
  end

  # Optional Method, IDK, i think mine is unnecessarily complicated
  # Time Complexity: O(n)
  # Space Complexity: O(log n)???
  def delete(key)
    # deletes just this node, return nil and leave children behind, rebalancing is optional
    # if node w/ key does not exist, do nothing and return nil
    return find_recursion(root, key, nil)
  end

  def find_recursion(currNode, key, parent)

    if currNode.nil?
      return

    else
      if key == currNode.key
        delete_and_rearrange(currNode, parent)
        # puts "\npost-replacing... ", self

      else
        find_recursion(currNode.left, key, currNode)
        find_recursion(currNode.right, key, currNode)
      end
    end
  end

  def delete_and_rearrange(nodeToDelete, parent)
    # cut off tree at parent--nodeToDelete   
    if !parent
      # nodeToDelete happens to be the BST root
      self.root = nil
    else
      if parent.left && parent.left == nodeToDelete
        parent.left = nil
      else
        parent.right = nil 
      end
    end

    # take all children of nodeToDelete, add them back into tree one by one
    if nodeToDelete.left
      add_subtree_back(nodeToDelete.left)
    end

    if nodeToDelete.right
      add_subtree_back(nodeToDelete.right)
    end
  end

  def add_subtree_back(rootOfSubtree)
    # puts "adding subtree under #{rootOfSubtree.key}/#{rootOfSubtree.value} back in"

    if rootOfSubtree.left 
      add_subtree_back(rootOfSubtree.left)
    end 

    if rootOfSubtree.right
      add_subtree_back(rootOfSubtree.right)
    end

    add(rootOfSubtree.key, rootOfSubtree.value)
  end



  # Useful for printing
  def to_s
    # return "#{self.inorder}"
    puts "IN ORDER = #{self.inorder()}"
    puts "PRE ORDER = #{self.preorder()}"
    # puts "POST ORDER = #{self.postorder()}"
  end

end
