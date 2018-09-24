# This program's input is a text file that contains the results of games
# from soccer league. The task is to create a file, that will show this league's table.
class Task08
  def next_string(inc_data) #Method, realizing keyboard input of data.
    new_string = gets.chomp.to_s
    new_string == "" ? (return inc_data) : inc_data << new_string + " "
    next_string(inc_data)
  end	

  def string_check(elem) #Method, that divides data to team names and scores.
    m = 0
    (("a".."z").to_a + ("A".."Z").to_a).each { |k| elem.scan(k) != [] ? m += 1 : m }
    m > 0 ? elem.to_s : elem.to_i
  end

  def prepare_match(way) #Method, that prepares the hash of team names and scores.
    inc_data = String.new
    puts "Enter the results of match, that have ended:"; next_string(inc_data) if way == 1
    inc_data = File.open('league_mathces.txt').read if way == 2
    match = inc_data.split(" ").collect { |i| i.gsub(",", "") }.collect { |n| string_check(n) }
    (match.size - 1).times { |i| (match[i] += " " + match[i + 1]; match[i + 1] = nil) if match[i].class == match[i + 1].class }
    return match = match.compact
  end

  def calc_scores(match) #Method, that calculates team ranks.
    scores = Hash[*match]
    scores.each_key { |k| scores[k] = 0 }
    (match.size/4).times do |n|
      scores[match[4 * n]] += 3 if match [4 * n + 1] > match [4 * n + 3]
      scores[match[4 * n]] += 1 if match [4 * n + 1] == match [4 * n + 3]
      scores[match[4 * n + 2]] += 1 if match [4 * n + 1] == match [4 * n + 3]
      scores[match[4 * n + 2]] += 3 if match [4 * n + 1] < match [4 * n + 3]
    end
    scores.sort.sort { |a,b| -a[1] <=> -b[1] }
  end

  def bodytask() #Method of main body of program. Determines output type of programm. 
    puts "Choose the way you want to calculate league table\n1: Strings entering\n2: By prepeared file"
    way = gets.chomp.to_i
    #$stdout = File.open('league_result.txt', 'w')
    $stderr = File.open('err.log', 'a')
    result = calc_scores(prepare_match(way))
    result.size.times { |n| puts "#{n+1}. team #{result[n][0]}, #{result[n][1]} pts" }
  end
end

Task08.new.bodytask

#inc_data = File.open('league_mathces.txt', 'r') { |file| file.read }