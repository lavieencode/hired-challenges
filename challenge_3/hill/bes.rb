# def big_enough_spread? array,spread
#   temp = array.dup
#   # p "temp before trans: #{temp}"
#   temp[0] -= spread
#   # p "temp sub zero after spread: #{temp[0]}"
#   temp[1..-1].each_with_index do |v,i|
#     p "v: #{v}  i: #{i}   temp[i]: #{temp[i]}  array: #{temp}"

#     if v + spread <= temp[i]
#       # p "in false return"
#       # p "value: #{v}  index: #{i} prev: #{temp[i]} "
#       # p "array as is: #{temp}"
#       return false
#     end
#     temp[i+1] = [ (temp[i+1] +1), v - spread].max
#     # p "after a sucessfull transform: #{temp}"
#   end
#   true
# end

# x = [1,2,3,4,5,6,7]


# def bes array, spread
#   arr = array.dup
#   arr[0] -= spread
#   index = 1
#   while index < arr.length
#     return false if (arr[index] + spread) <= arr[index-1]
#     arr[index] = [(arr[index - 1] + 1), arr[index] - spread].max
#     index += 1
#   end
#   true
# end

# x = [0,0,0,0]
# y = [1995, 3613, 3722, 8217, 9791]

# p bes x, 1

def index_of_highest array
  max = array[0]
  index = 0
  array.each_with_index do |val, i|
    if val > max
      max = val
      index = i
    end
  end
  index
end

def index_of_lowest array
  min = array[0]
  index = 0
  array.each_with_index do |val, i|
    if val <= min
      min = val
      index = i
    end
  end
  index
end

def first_last_length_spread list
  return 0 if list.empty?
  first = list[0]
  last = list[-1]
  len = list.count
  total_distance = [0, (first - last + len - 1)].max
  (total_distance/2.0).ceil
end

def highest_to_low_spread list
  high = index_of_highest list
  # p "high: #{list[high]}"
  low = index_of_lowest list[high..-1]
  # p "low: #{list[low]}"
  # p "modified low: #{list[high + low]}"
  # p list[high..-1]
  # p high
  # p low
  # p list[high..low].to_s
  sub_array = list[high..(low + high)]
  first_last_length_spread sub_array
end

# def exp array
#   temp = array.dup
#   max_spread = highest_to_low_spread temp
#   high_index = index_of_highest temp
#   return max_spread if (index_of_highest temp) == 0
#   return [max_spread, (exp temp[0...high_index])].max
# end

def exp array
  max_spread = highest_to_low_spread array
  sub_arr = array.dup
  while sub_arr.length > 1
    high_index = index_of_highest sub_arr
    low_index = index_of_lowest array
    local_spread = first_last_length_spread array[high_index..low_index]
    max_spread = [max_spread, local_spread].max
    sub_arr = sub_arr[0...high_index]
  end
  max_spread
end

test = [9369, 2581, 8500, 2656, 6906, 5613, 9370, 4258, 315, 5228]
p exp test



