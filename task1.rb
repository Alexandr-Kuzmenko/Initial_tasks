# Вывести в консоль, 30 раз "<3 ruby", каждый в новой строке, 
# 10ый, 20ый, и 25ый вывод вывести просто "ruby".
class Task01
  def bodytask
    30.times do |i|
      [10, 20, 25].include?(i+1) ? puts("#{i + 1} <3 ruby") : puts("#{i + 1} ruby")
    end
  end
end
Task01.new.bodytask
