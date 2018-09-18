puts
@i=1
@str1='<3 ruby'
str2='ruby'
n=40
n.times {
puts "#{@i}  #{@str1}" if @i==10 or @i==20 or @i==25
puts "#{@i}  #{str2}" if @i!=10 or @i!=20 or @i!=25
  @i+=1 
  }
puts