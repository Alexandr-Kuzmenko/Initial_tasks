# Вывести в консоль матрицу с еденицами по диагонали. Размер задается с консоли.
class Task03
  def bodytask
    puts "Введите размер матрицы:"
    size = gets.chomp.to_i
    i, n = 1, 1
    while i <= size do
      while n <= size do
        print '0 ' if i != n
        print '1 ' if i == n
        n += 1
      end
      puts
      n = 1
      i += 1
    end
  end
end
Task03.new.bodytask
