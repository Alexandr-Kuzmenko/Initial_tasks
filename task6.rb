# Написать метод, который принимает многомерный массив и тип данных, возвращает массив этих типов. 
class Task06
  def get_all(*array, type)   
    array = array.flatten
    arr_new = Array.new
    n = 0
    for n in 0...array.size do
      arr_new << array[n] if array[n].class.to_s == type
    end
    return arr_new
  end

  def bodytask
    ar1 = [[1, 2, 3, 4, '1'], ['2', '5', '10'], [111, 222, 333, 444], ['i', 'love', 'ruby'], { key: 'value' }, [[['text', 100_000]]]]
    puts "Выберите тип преобразования:\n1: String\n2: Integer\n"
    dtype = gets.chomp.to_i
    type = "String" if dtype == 1
    type = "Integer" if dtype == 2   
    arr_new = get_all(ar1, "#{type}")
    print arr_new
    puts
  end
end
Task06.new.bodytask