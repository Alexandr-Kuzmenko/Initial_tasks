# Написать рекурсивный метод для поиска значения ключа key9 в хеше:
def vsearch(h, key)
  v = "none"
  v = "the value of entered key is: #{h[:"#{key}"]}" if h.keys.include?(:"#{key}") == true  
  puts v if h.keys.include?(:"#{key}") == true
  return v if v != "none" 
  arr_values = h.values
  arr_values.delete_if {|x| x == {} || x.class.to_s != 'Hash'}
  n = 0
  arr_values.each do
    h = arr_values[n] if arr_values[n].class.to_s == 'Hash'
    vsearch(h,key)
  end
end

puts "Введите ключ по которому необходим поиск в хэше (например - key9)\n"
k = gets.chomp

h = { key1:  {} , key2: {}, key3: { key4: 'str', key5: 'str2', key6: { key7: { key8: 1, key9: [2]} } }}

vsearch(h,k)
