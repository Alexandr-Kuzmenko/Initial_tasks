r=0
until r>=10 && r<=25 do
puts "Введите размер радиуса круга от 10 до 25:"
r=gets.chomp.to_i
if r<10 || r>25 then
  puts "Вы ввели недопустимый радиус круга, попробуйте еще раз"
else
  puts "Построение окружности заданного радиуса"  
end
end 
i=1
k=1
  for i in 1..51 do
  for k in 1..51 do
    if (i-26)**2+(k-26)**2 > r**2 then
      print '| '
    else
      print '0 ' 
    end
      k+=1 
    end
      puts
  k=1  
  i+=1
    end