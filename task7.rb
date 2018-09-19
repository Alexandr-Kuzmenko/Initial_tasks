# Предыдущие таски обьеденить в классы, собрать вместе в модуле.
# Каждый таск запускается с помощью консоли. 
# То-есть, ввели в консоли 1 - запускается и выполняется первый таск.
module Mine_module
  def task1
    require '/home/developer/my_doc/Ruby_code/task1_var2.rb'
  end

  def task2
    require '/home/developer/my_doc/Ruby_code/task2.rb'
  end

  def task3
    require '/home/developer/my_doc/Ruby_code/task3.rb'
  end

  def task4
    require '/home/developer/my_doc/Ruby_code/task4.rb'
  end

  def task5
    require '/home/developer/my_doc/Ruby_code/task5.rb'
  end

  def task6
    require '/home/developer/my_doc/Ruby_code/task6.rb'
  end
end

class Ftask
  include Mine_module

  def choosing(task)
    n_task = 'task' + task.to_s
    eval ("#{n_task}") if task.between?(1, 6) 
  end

  def bodytask
    puts "Выберите таск, который необходимо выполнить\n"
    task = gets.chomp.to_i
    Ftask.new.choosing(task)
  end
end
Ftask.new.bodytask
