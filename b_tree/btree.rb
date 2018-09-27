class Tree
  attr_accessor :lchild
  attr_accessor :rchild
  attr_accessor :root

  def initialize(x = nil)
  	@root = x
    @lchild = nil
    @rchild = nil
  end

  def insert(x) # Main method to create new nodes.
    if @root
      case x <=> @root
      when -1
        @lchild == nil ? @lchild = Tree.new(x) : @lchild.insert(x)    
      when 1
        @rchild == nil ? @rchild = Tree.new(x) : @rchild.insert(x)  
      when 0
        return p "Impossible to add element #{x}, it already exists"  
      end
    else  
      @root = x  
    end       
    #p 'Node created'
  end

  def search(y) # Main method for starting search.
    if @root
      return p "seeked value:#{y} is main root, no parents for it. left child:#{@lchild.root} right child:#{rchild.root}" if y == @root
      way = 'tree'
      out1, out2, out3, out4 = smart_search(y, way)
      p "seeked value:#{out1} parent:#{out2} left child:#{out3} right child:#{out4}"
    else
      p "no values in tree present at all" 
    end
  end
  
  def smart_search(y, way)  
    way = way
    case y <=> @root
    when -1
      if @lchild != nil
        set_parent(@root, @lchild)
        way << '.lchild'
        @lchild.smart_search(y, way)
      else
        p 'no such value in tree'
      end       
    when 1
      if @rchild != nil
        set_parent(@root, @rchild)
        way << '.rchild'
        @rchild.smart_search(y, way)
      else
        p 'no such value in tree'
      end   
    when 0
      @lchild == nil ? left = "none" : left = @lchild.root
      @rchild == nil ? right = "none" : right = @rchild.root
      return y, get_parent[0], left, right, way
    end 
  end 

  def set_parent(par, sub_tree)
    @@parent = par
    @@sub_tree = sub_tree
  end
  
  def get_parent
    return @@parent, @@sub_tree
  end
  
  def array_view(tree) #Main method to make array from the tree.
    tree_keys = Array.new
    tree_keys << tree
    tree_data = Array.new
    lvl = 0
    while tree_keys != [] do 
      tree_data += ["lvl:#{lvl}"]
      lvl += 1
      tree_data, tree_keys = tree_walk(tree_data, tree_keys)
    end
    print "#{tree_data}\n"
  end

  def tree_walk(data, keys)
   data += keys.map { |elem| elem.root }.sort
   keys_left = keys.map { |elem| elem.lchild != nil ? elem.lchild : nil }.compact
   keys_right = keys.map { |elem| elem.rchild != nil ? elem.rchild : nil }.compact
   keys = keys_left + keys_right
   return data, keys
  end

  def delete_branch(y, tree) # Main method to delete nodes.
    if @root
      if y == @root
        tree = nil
        p 'you just deleted full tree'  
      else
        way = smart_search(y, 'tree')[4]
        way << ' = nil'
        eval(way)
        p "branch #{y} deleted"
      end
    else
      p 'no tree at all to delete'
    end
  end
  
  def start #Template for the start
    tree = Tree.new
    elems = [100, 50, 150, 25, 75, 125, 175, 12, 37, 62, 87, 112, 137, 162, 187]
    elems.each { |x| tree.insert(x) }
    print tree.array_view(tree)
  end  
end

#Tree.new.start
tree = Tree.new
elems = [100, 50, 150, 25, 75, 125, 175, 12, 37, 62, 87, 112, 137, 162, 187]
elems.each { |x| tree.insert(x) }
print tree.array_view(tree)
tree.search(37)
tree.search(75)
tree.insert(289)
tree.insert(132)
tree.insert(7)
tree.insert(77)
tree.delete_branch(75, tree)
print tree.array_view(tree)

#tree.add_elem
#puts tree
#tree.search(100) 