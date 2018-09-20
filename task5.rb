# Написать метод, который принимает строку и приводит её в CamelCase, 
# ruby_case_underscore и css-case.
class Task05  
  def formatize(text, format)
    #puts text.split(' ').map(&:capitalize).join(' ') if format == 1
    puts text.split(' ').map(&:capitalize).join if format == 1
    puts text.downcase.gsub(' ', '_') if format == 2
    puts text.gsub(' ', '-') if format == 3   
  end

  def bodytask	
    str = 'i love ruby'
    puts "Choose one from list to change the string:\n1 :camel\n2 :underscope\n3 :css"
    format = gets.chomp.to_i
    puts formatize(str, format)
  end
end
# Task05.new.bodytask
