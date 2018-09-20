# Нарисовать в консоле круг, диаметр\радиус которого задается с консоли.
class Task02 
  def bodytask
    puts "Введите размер радиуса окружности, которую хотите построить:"
    rad = gets.chomp.to_i
    (rad * 2 + 1).times do |i|
      (rad * 2 + 1).times do |k|
        (i - rad)**2 + (k - rad)**2 > rad**2 ? print('- ') : print('0 ') 
      end
      puts 
    end
  end
end
# Task02.new.bodytask
