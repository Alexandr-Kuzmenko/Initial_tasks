# Вывести в консоль, 30 раз "<3 ruby", каждый в новой строке, 
# 10ый, 20ый, и 25ый вывод вывести просто "ruby".
class Task01
  def bodytask
    i = 1
    str1 = '<3 ruby'
    str2 = 'ruby'
    n = 33
    n.times {
    puts "#{i}  #{str1}" if i == 10 || i == 20 || i == 25
    puts "#{i}  #{str2}" if i != 10 || i != 20 || i != 25
    i += 1 }
  end
end
Task01.new.bodytask
