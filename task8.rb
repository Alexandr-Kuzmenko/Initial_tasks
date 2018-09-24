# This program's input is a text file that contains the results of games
# from soccer league. The task is to create a file, that will show this league's table.
class Task08
  def string_check(elem) #Method, that divides data to team names and scores.
    m = 0
    (("a".."z").to_a + ("A".."Z").to_a).each { |k| elem.scan(k) != [] ? m += 1 : m }
    m > 0 ? elem.to_s : elem.to_i
  end

  def prepare_match #Method, that prepares the massive of matches.
    inc_data = File.open('league_mathces.txt').read
    match = inc_data.split(" ").collect { |i| i.gsub(",", "") }.collect { |n| string_check(n) }
    match.each.with_index do |_elem, i|
      if match[i].class == match[i + 1].class
        match[i] += " " + match[i + 1]
        match.delete_at(i + 1)
      end
    end 
    (match.size / 4).times do 
      match << match[0..3]
      4.times do match.shift end
    end
    match
  end

  def calc_scores(match) #Method, that calculates team ranks.
    scores = Hash[*match.flatten]
    scores.each_key { |k| scores[k] = 0 }
    match.each.with_index do |_elem, i|
      scores[match[i][0]] += 3 if match[i][1] > match[i][3]
      scores[match[i][0]] += 1 if match[i][1] == match[i][3]
      scores[match[i][2]] += 1 if match[i][1] == match[i][3]
      scores[match[i][2]] += 3 if match[i][1] < match[i][3]
    end
    scores.sort.sort { |a, b| -a[1] <=> -b[1] }
  end

  def start #Method with main body of programm.
    #$stdout = File.open('league_result.txt', 'w')
    $stderr = File.open('err.log', 'a')
    input_massive = prepare_match
    result = calc_scores(input_massive)
    result.size.times { |n| puts "#{n+1}. team #{result[n][0]}, #{result[n][1]} pts" }
  end
end

#Task08.new.start
