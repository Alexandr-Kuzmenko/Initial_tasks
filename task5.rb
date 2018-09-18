def formatize(format, text)   
text=text.gsub(' ', '') if format ==1
text=text.gsub(' ', '_') if format ==2
text=text.gsub(' ', '-') if format ==3   
return text
end
	
	str = 'i love ruby'
   puts "Выберите тип преобразования:\n1: camel\n2: underscope\n3: css"
   @format=gets.chomp.to_i
   str2=formatize(@format, str)
puts str2