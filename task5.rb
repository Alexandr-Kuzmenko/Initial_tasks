# Написать метод, который принимает строку и приводит её в CamelCase, 
# ruby_case_underscore и css-case.
class Task05  
  def formatize(format, text)   
    text = text.gsub(' ', '') if format == 1
    text = text.gsub(' ', '_') if format == 2
    text = text.gsub(' ', '-') if format == 3
    return text
  end

  def bodytask	
    str = 'i love ruby'
    puts "Выберите тип преобразования:\n1: camel\n2: underscope\n3: css"
    format = gets.chomp.to_i
    puts formatize(format, str)
  end
end
Task05.new.bodytask
