class Tree
  attr_accessor :lchild
  attr_accessor :rchild
  attr_accessor :root

  def initialize(x = nil)
  	@root = x
    @lchild = nil
    @rchild = nil
  end

  def main_menu
  end

  def insert(x)  
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
    #p 'done'
  end

  def add_elem
    #count = 0 if !count
    #puts "Remember! You can not add the element that already exists" if count == 0
    #puts "Enter the element, you want to add to tree" if count == 0
    new_elem = gets.chomp
    return main_menu if new_elem == 'exit'
    string_check(new_elem) ? p('You have entered not a number') : insert(new_elem.to_i)
    puts "Enter next element or print: exit - to exit"
    #count += 1
    add_elem
  end

  def string_check(elem)
    m = 0
    (("a".."z").to_a + ("A".."Z").to_a).each { |k| elem.scan(k) != [] ? m += 1 : m }
    m > 0 ? true : false
  end

  def search(y)
    if @root
      return p "seeked value:#{y} is main root, no parents for it. left child:#{@lchild.root} right child:#{rchild.root}" if @root == y
      smart_search(y)
    else
      p "no values in tree present at all" 
    end
  end

  def set_parent(par)
    @@parent = par
  end
  
  def get_parent
    @@parent
  end
  
  def smart_search(y)  
    case y <=> @root
    when -1
      if @lchild != nil
        set_parent(@root)
        @lchild.smart_search(y)
      else
        p 'no such value in tree'
      end       
    when 1
      if @lchild != nil
        set_parent(@root)
        @rchild.smart_search(y)
      else
        p 'no such value in tree'
      end   
    when 0
      @lchild == nil ? left = "none" : left = @lchild.root
      @lchild == nil ? right = "none" : right = @rchild.root
      return p "seeked value:#{y} parent:#{get_parent} left child:#{left} right child:#{right}"
    end 
  end 

  def array_view(tree) #Method of walkthrough forward
    tree_keys = Array.new
    tree_keys << tree
    tree_data = Array.new
    stage = 0
    while tree_keys != [] do 
      tree_data += ["|"]
      stage += 1
      tree_data, tree_keys = tree_walk(tree_data, tree_keys)
    end
    tree_data 
  end

  def tree_walk(data, keys)
   data += keys.map { |elem| elem.root }.sort
   keys_left = keys.map { |elem| elem.lchild != nil ? elem.lchild : nil }.compact
   keys_right = keys.map { |elem| elem.rchild != nil ? elem.rchild : nil }.compact
   keys = keys_left + keys_right
   return data, keys
  end

  #def delete_elem(y)
  #  search(y) 
  #  
  #end
     
end

elems = [100, 50, 150, 25, 75, 125, 175, 12, 37, 62, 87, 112, 137, 162, 187]
#elems.each { |n| print "#{n} "}
#puts
tree = Tree.new
elems.each { |x| tree.insert(x) }
tree.traverse {|x| print "#{x} " }
puts
#tree.add_elem

print "#{tree.array_view(tree)}\n"
#p true if tree.get_parent == nil
tree.search(37)
tree.search(75)
tree.search(100)

#tree.search(100)
#puts tree.array_view { |x| print "#{x} #{x.class} " }
#tree.traverse {|x| print "#{x} " }#{x.lchild}#{x.rchild} "}
=begin
puts
puts
tree.root ? puts("#{tree.root}") : p("no root")
tree.lchild ? puts("#{tree.lchild.root}") : p("lchild nill")
tree.rchild ? puts("#{tree.rchild.root}") : p("Rchild nill")
#=begin
tree.lchild.lchild ? puts("#{tree.lchild.lchild.root}") : p("ll_branch nill")
tree.lchild.rchild ? puts("#{tree.lchild.rchild.root}") : p("lr_branch nill")
tree.rchild.lchild ? puts("#{tree.rchild.lchild.root}") : p("rl_branch nill")
tree.rchild.rchild ? puts("#{tree.rchild.rchild.root}") : p("rr_branch nill")
puts

puts
puts "#{tree.class}"
puts "#{tree.lchild.class}" 
puts "#{tree.rchild.class}"
puts "#{tree.lchild.lchild.class}"
puts "#{tree.lchild.rchild.class}"
puts "#{tree.rchild.lchild.class}"
puts "#{tree.rchild.rchild.class}"
puts

=begin
puts "#{tree.lchild.lchild.class}" 
puts "#{tree.rchild.rchild.class}"

tree.lchild.lchild ? puts("#{tree.lchild.lchild}") : p("Left's nill")
tree.rchild.rchild ? puts("#{tree.rchild.rchild}") : p("Right's nill")
=end 