# Написать метод, который принимает многомерный массив и тип данных, возвращает массив этих типов. 
class Task06
  def get_all(array, type)   
    array.flatten.map { |v| v if v.class.to_s == type }.compact
  end

  def bodytask
    ar1 = [[1, 2, 3, 4, '1'], ['2', '5', '10'], [111, 222, 333, 444], ['i', 'love', 'ruby'], { key: 'value' }, [[['text', 100_000]]]]
    #puts "Выберите тип преобразования:\n1: String\n2: Integer\n3: Hash\n"
    puts "Выберите тип преобразования:\n1: String\n2: Integer\n"
    dtype = gets.chomp.to_i
    type = "String" if dtype == 1
    type = "Integer" if dtype == 2
    #type = "Hash" if dtype == 3   
    print arr_new = get_all(ar1, "#{type}")
    puts
  end
end
p Task06.new.bodytask