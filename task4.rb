# Написать рекурсивный метод для поиска значения ключа key9 в хеше:
class Task04
  # Метод ниже не модифицирует изначальный обрабатываемый хэш
  def vsearch(h, key)
    puts v = "the value of entered key is: #{h[key.to_sym]}" if h.keys.include?(key.to_sym)
    return v if v
    arr_values = h.values
    arr_values.delete_if { |x| x == {} || x.class != Hash }
    arr_values.size.times do |n|
      h = arr_values[n] if arr_values[n].class == Hash
      vsearch(h, key)
    end  
  end

  def bodytask
    puts "Введите ключ по которому необходим поиск в хэше (например - key9)\n"
    k = gets.chomp
    h = { key1:  {} , key2: {}, key3: { key4: 'str', key5: 'str2', key6: { key7: { key8: 1, key9: [2]} } }}
    vsearch(h,k)
  end
end
# Task04.new.bodytask

=begin
  Изначальный вариант текущих строк 9-12:
  n = 0
  arr_values.each do
    h = arr_values[n] if arr_values[n].class == Hash
    vsearch(h, key)
  end
=end
