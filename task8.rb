# This program's input is a text file that contains the results of games
# from soccer league. The task is to create a file, that will show this league's table.
#$stdin = File.open('league_mathces.txt')
#$stdout = File.open('league_result.txt', 'w')
$stderr = File.open('err.log', 'a')
#inc_data = IO.read('league_mathces.txt')
#data = String.new
inc_data = File.open('league_mathces.txt', 'r') { |file| file.read }
#inc_data.each { |line| data << inc_data[line] }
inc_file = open 'league_mathces.txt'
inc_data = inc_file.read
inc_file.close 
matches = inc_data.split("\n")
matches.size.times do |n|
matches << matches[n].to_s.split(",")
matches[n].delete 	
end
=begin
matches = Array.new
inc_file.each { |line| matches << line }
 
matches.size { |n| matches[n].gsub("\n", "") }   
=end

#puts inc_data.scan("\n")
#inc_data.gsub("^\n\r", "1")

#print inc_data2.map()
#inc_data = inc_data.split('\n')
#inc_data = inc_data[0].split(' ')


#rint data
#puts inc_data2.size
print matches
puts