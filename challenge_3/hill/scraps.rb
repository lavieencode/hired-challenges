

# set = []
# 9.times {set << rand(100)}
# p set

# def min_spread array
#   return 0 if array[-1] > (array[0] + array.length)
#   spread =   array[-1] - ( array[0] + array.length)
#   (spread/-2).floor
# end

# def amplitude array
#   most = 0
#   (array.length - 1).times do |index|
#     gap = array[index] - array[index + 1]
#     p "1st: #{array[index]}  2nd: #{array[index + 1]} gap: #{gap}"
#     most = gap if gap > most
#   end
#   (most/2.0).ceil + 1
# end

# a =  min_spread set
# b =  amplitude set
# p a
# p b
# p "initial min spread #{a>b ? a : b}"

def exp array
  max_spread = highest_to_low_spread array
  sub_arr = array.dup
  while sub_arr.length > 1
    # p sub_arr
    high_index = index_of_highest sub_arr
    low_index = index_of_lowest array[high_index..-1]
    local_spread = highest_to_low_spread array[high_index..low_index]
    # p "high index: #{high_index}  low index: #{low_index}  high value: #{array[high_index]} low value: #{array[low_index]}"
    max_spread = [max_spread, local_spread].max
    sub_arr = sub_arr[0...high_index]
  end
  max_spread
end