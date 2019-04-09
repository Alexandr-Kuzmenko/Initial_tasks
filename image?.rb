  def image?(filename)
    formats = ['.jpg', '.jpeg', '.png']
    formats.each do |el|
      check = true
      el.reverse.chars.each.with_index { |k, index| check = false if k != filename.reverse[index] }
      return true if check == true
    end
    false
  end