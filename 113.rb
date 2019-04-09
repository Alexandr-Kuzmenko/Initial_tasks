def digit?(n)
  (0..9).to_a.join.index(n) ? true : false
end

def to_postfix(str, k = true)
  arr = str.split('')
  loop do
    break unless k

    k = nil
    arr.each_cons(2).with_index do |pair, ind|
      unless digit?(pair[0]) && digit?(pair[1])
        if pair[0] < pair[1]
          arr[ind], arr[ind +1] = pair[1], pair[0]
          k = true
        end
        #break
      end
    end
  end
  arr.join ''
end
str = "2+7*5"
puts to_postfix(str)
Should return "275*+"
to_postfix("3*3/(7+1)") # Should return "33*71+/"
to_postfix("5+(6-2)*9+3^(7-1)") # Should return "562-9*+371-^+"


p '+' <=> '*'

# print arr = "2+7*5".split('')
# puts
#
# arr.each_cons(2).with_index do |pair, ind|
#   unless digit?(pair[0]) && digit?(pair[1])
#     arr[ind], arr[ind +1] = pair[1], pair[0] if pair[0] < pair[1]
#   end
# end
# print arr
# puts
