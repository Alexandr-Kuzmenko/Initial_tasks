# This program's input is a text file that contains the results of games
# from soccer league. The task is to create a file, that will show this league's table.
class Task08
  def string_check(elem)
    m = 0
    (("a".."z").to_a + ("A".."Z").to_a).each { |k| elem.scan(k) != [] ? m += 1 : m }
    m > 0 ? elem.to_s : elem.to_i
  end

  def prepare_match()
    inc_file = open 'league_mathces.txt'
    inc_data = inc_file.read
    inc_file.close 
    match = inc_data.split(" ").collect { |i| i.gsub(",", "") }.collect { |n| string_check(n) }
    (match.size - 1).times { |i| (match[i] += " " + match[i + 1]; match[i + 1] = nil) if match[i].class == match[i + 1].class }
    return match = match.compact
  end

  def calc_scores(match)
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

  def bodytask()
    $stdout = File.open('league_result.txt', 'w')
    $stderr = File.open('err.log', 'a')
    result = calc_scores(prepare_match)
    result.size.times { |n| puts "#{n+1}. team #{result[n][0]}, #{result[n][1]} pts" }
    puts
  end
end

#Task08.new.bodytask

#$stdin = File.open('league_mathces.txt')
#inc_data = IO.read('league_mathces.txt')
#inc_data = File.open('league_mathces.txt', 'r') { |file| file.read }