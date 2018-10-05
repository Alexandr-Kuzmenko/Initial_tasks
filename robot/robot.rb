# Class containing common methods.
class Task
  def string_check(elem)
    (('a'..'z').to_a + ('A'..'Z').to_a).each { |k| return true if elem.include?(k) }
    false
  end

  def getelem
    new_elem = ''
    while new_elem.class == String
      new_elem = gets.chomp
      string_check(new_elem) ? p('incorrect') : new_elem = new_elem.to_i
    end
    new_elem
  end

  def start
    @@bfield = Field.new
    puts "possible coords for landing x:0-#{@@bfield.border[0]} y:0-#{@@bfield.border[1]}"
    Robot.new.menu
  end
end

# Class containing main attributes.
class Coords < Task
  attr_accessor :x
  attr_accessor :y
end

# Class field
class Field < Coords
  def initialize(x = 5, y = 6)
    p 'Enter field size X, or press Enter for default'
    temp = getelem
    temp.zero? ? x : x = temp
    @x = x
    p 'Enter field size Y, or press Enter for default'
    temp = getelem
    temp.zero? ? y : y = temp
    @y = y
  end

  def border
    borders = [@x - 1, @y - 1]
  end
end

# Class robot
class Robot < Coords
  attr_accessor :f

  def initialize
    @onfield = nil
  end

  def compass
    side = %w[west north east south]
    puts "Choose course \n 1: west \n 2: north \n 3: east \n 4: south"
    while side.class == Array
      i = gets.chomp
      i.to_i.between?(1, 4) ? side = side[i.to_i - 1] : p('course incorrect, choose again')
    end
    @f = side
  end

  def place
    p 'Enter drop coord X'
    @x = getelem
    p 'Enter drop coord Y'
    @y = getelem
    @f = compass
    if @x > @@bfield.border[0] || @y > @@bfield.border[0]
      p 'You can not drop robot out of field'
    else
      @onfield = 1
      p "robot coords #{x}:#{y} course:#{f}"
    end
    menu
  end

  def report
    puts("robot coords #{@x}:#{@y} course: #{@f}")
    menu
  end

  def left
    side = %w[west north east south]
    f = @f
    side.each.with_index { |el, ind| @f = side[ind - 1] if f == el }
    menu
  end

  def right
    side = %w[west north east south]
    f = @f
    side.each.with_index { |el, ind| @f = (side * 2)[ind + 1] if f == el }
    menu
  end

  def move
    if @f == 'north'
      (@y + 1) <= @@bfield.border[1] ? @y += 1 : p('no way, moving rejected')
    elsif @f == 'east'
      (@x + 1) <= @@bfield.border[0] ? @x += 1 : p('no way, moving rejected')
    elsif @f == 'south'
      (@y - 1) >= 0 ? @y -= 1 : p('no way, moving rejected')
    elsif @f == 'west'
      (@x - 1) >= 0 ? @x -= 1 : p('no way, moving rejected')
    end
    menu
  end

  def menu
    puts "Choose action \n 1: place robot \n 2: turn robot left \n 3: turn robot right \n"
    puts " 4: move robot \n 5: get a report \n print exit to close programm"
    act = gets.chomp
    return if act == 'exit'
    if act.to_i == 1
      place
    elsif act.to_i == 2
      @onfield ? left : error
    elsif act.to_i == 3
      @onfield ? right : error
    elsif act.to_i == 4
      @onfield ? move : error
    elsif act.to_i == 5
      @onfield ? report : error
    end
    menu unless act.to_i.between?(1, 5)
  end

  def error
    p 'put robot on field at first'
    menu
  end
end

Task.new.start
