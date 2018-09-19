#Вывести в консоль, 30 раз "<3 ruby", каждый в новой строке, 
#10ый, 20ый, и 25ый вывод вывести просто "ruby".
i = 1
str1 = '<3 ruby'
str2 = 'ruby'
while i <= 30 do
  if i == 10 or i == 20 or i == 25
    puts "#{i}  #{str1}"
  else
    puts "#{i}  #{str2}"
  end
  i += 1
end
