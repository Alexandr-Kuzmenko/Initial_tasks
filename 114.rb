require 'bigdecimal'

def sum_of_squares(n)
  return 1 if (Math.sqrt(n) % 1).zero?
  # max = double_sys_min(n)
  acc_arr = (1..(Math::sqrt(n).to_i)).to_a.map {|el| el ** 2 }
  while (k ||= 2) < 10 # max
    search = []
    k.times { search << acc_arr }
    search.flatten.permutation(k).to_a.map {|el| el.sort { |x,y| y <=> x } }.uniq.each {|el| return k if el.sum == n }
    k += 1
  end
  # max
end

def double_sys_min(n)
  min = 0
  arr = n.to_s(2).reverse.split('').map!.with_index { |el, ind| el == '1' ? ind : nil }.compact
  arr.each{ |el| el % 2 == 0 ? min += 1 : min += 2 }
  min
end

n = 15
puts doubled_min(n)
puts mmethod(15)
print (1..(Math::sqrt(n).to_i)).to_a
puts
search = []
4.times {search << (1..(Math::sqrt(n).to_i)).to_a }
print search
puts
search = search.flatten.sort { |x,y| y <=> x }.permutation(4).to_a.map! {|el| el.sort { |x,y| y <=> x } }.uniq
print search.map {|el| el.map { |subl| subl ** 2 }.sum }
puts
