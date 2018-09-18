puts "Введите размер матрицы:"
size=gets.chomp.to_i
i=1
n=1
while i<=size do
  while n<=size do
  print '0 ' if i!=n
  print '1 ' if i==n
  n+=1
  end
puts
  n=1  
i+=1
end