# Вывести в консоль, 30 раз "<3 ruby", каждый в новой строке, 
# 10ый, 20ый, и 25ый вывод вывести просто "ruby".
class Task01
  def owntask
    i = 1
    str1 = '<3 ruby'
    str2 = 'ruby'
    while i <= 30 do
      if i == 10 || i == 20 || i == 25
        puts "#{i}  #{str1}"
      else
        puts "#{i}  #{str2}"
      end
      i += 1
    end
  end
end
Task01.new.owntask
