#Написать рекурсивный метод для поиска значения ключа key9 в хеше:
def vsearch(h, key)
  v = "none"
  v = "the value of entered key is: #{h[:"#{key}"]}" if h.keys.include?(:"#{key}") == true  
  return v if v != "none"
  if h.keys.include?(:"#{key}") == false then 
    n=0
    arr_values = h.values
    arr_values.delete_if {|x| x == {}}
    arr_values.delete_if {|x| x.class.to_s != 'Hash'}
    for n in 0...arr_values.size do
      h=arr_values[n] if arr_values[n].class.to_s == 'Hash'
      puts vsearch(h,key)
    end
  end
end

puts "Введите ключ по которому необходим поиск в хэше (например - key9)\n"
k = gets.chomp

h = { key1:  {} , key2: {}, key3: { key4: 'str', key5: 'str2', key6: { key7: { key8: 1, key9: [2]} } }}

puts vsearch(h,k)
