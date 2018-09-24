
# Предыдущие таски обьеденить в классы, собрать вместе в модуле.
# Каждый таск запускается с помощью консоли. 
# То-есть, ввели в консоли 1 - запускается и выполняется первый таск.
require '/home/developer/my_doc/Ruby_code/task1.rb'
require '/home/developer/my_doc/Ruby_code/task2.rb'
require '/home/developer/my_doc/Ruby_code/task3.rb'
require '/home/developer/my_doc/Ruby_code/task4.rb'
require '/home/developer/my_doc/Ruby_code/task5.rb'
require '/home/developer/my_doc/Ruby_code/task6.rb'
require '/home/developer/my_doc/Ruby_code/task8.rb'

module Mine_module
  def task1
    Task01.new.bodytask
  end

  def task2
    Task02.new.bodytask
  end

  def task3
    Task03.new.bodytask
  end

  def task4
    Task04.new.bodytask
  end

  def task5
    Task05.new.bodytask
  end

  def task6
    Task06.new.bodytask
  end

  def task8
    Task08.new.start
  end
end

class Ftask
  include Mine_module

  def choosing(task)
    n_task = 'task' + task.to_s
    eval ("#{n_task}") if task.between?(1, 8) 
  end

  def bodytask
    puts "Выберите таск, который необходимо выполнить (Например:3)\n"
    task = gets.chomp.to_i
    Ftask.new.choosing(task)
  end
end
Ftask.new.bodytask
