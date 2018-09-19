# Нарисовать в консоле круг, диаметр\радиус которого задается с консоли.
class Task02 
  def bodytask
    r = 0
    until r>=10 && r<=25 do
      puts "Введите размер радиуса круга от 10 до 25:"
      r = gets.chomp.to_i
      t1 = "Вы ввели недопустимый радиус круга, попробуйте еще раз"
      t2 = "Построение окружности заданного радиуса"
      puts t1 if r < 10 || r > 25
      puts t2 if r.between?(10, 25)
    end
    i, k = 1, 1
    for i in 1..51 do
      for k in 1..51 do
        print '| ' if (i - 26)**2 + (k - 26)**2 > r**2
        print '0 ' if (i - 26)**2 + (k - 26)**2 <= r**2  
        k += 1 
      end
      puts
      k = 1  
      i += 1
    end
  end
end
Task02.new.bodytask
