# Вывести в консоль матрицу с еденицами по диагонали. Размер задается с консоли.
class Task03
  def bodytask
    puts "Введите размер матрицы:"
    m_size = gets.chomp.to_i
    m_size.times do |i|
      m_size.times { |k| i == k ? print('1 ') : print('0 ') }
      puts
    end  
  end
end
# Task03.new.bodytask
