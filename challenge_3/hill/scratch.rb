require 'pry'


def first_last_length_spread list
  return 0 if list.empty?
  first = list[0]
  last = list[-1]
  len = list.count
  total_distance = [0, (first - last + len - 1)].max
  (total_distance/2.0).ceil
end

def largest_one_gap_spread list
  max = 0
  list[0...-1].each_with_index do |val, index|
    total_distance = val - list[index +1]
    next if total_distance <= -1
    spread = (total_distance/2.0).floor + 1
    max = spread if spread > max
  end
  max
end

def highest_to_low_spread list
  high = index_of_highest list
  # p "high: #{list[high]}"
  # p "high: #{high}  list length:  #{list.length} array: #{list}  passed array: #{list[high..-1]}"
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

def high_to_lowest_spread list
  low = index_of_lowest list
  high = index_of_highest list[0..low]
  first_last_length_spread list[high..low]
end

def index_of_highest array
  temp = []
  array.each_with_index {|v,i| temp << v+(array.length - i)}
  max = temp[0]
  index = 0
  temp.each_with_index do |val, i|
    if val > max
      max = val
      index = i
    end
  end
  index
end

def index_of_lowest array
  temp = []
  array.each_with_index {|v,i| temp << v-i}
  min = temp[0]
  index = 0
  temp.each_with_index do |val, i|
    if val <= min
      min = val
      index = i
    end
  end
  index
end

def lowest_initial_spread list
  [(first_last_length_spread list),
  (largest_one_gap_spread list),
  (highest_to_low_spread list),
  (high_to_lowest_spread list),
  (exp list)].max
end

def solve_hill list
  if list.size <= 1
    return 0
  end
  spread = lowest_initial_spread list
  p list.to_s
  return spread if perfect_spread?(list, spread)
  return (spread + 1) if perfect_spread?(list, spread + 1)

  p "failing spread:  #{spread}"
end

def big_enough_spread? array,spread
  arr = array.dup
  arr[0] -= spread
  index = 1
  while index < arr.length
    return false if (arr[index] + spread) <= arr[index-1]
    arr[index] = [(arr[index - 1] + 1), arr[index] - spread].max
    index += 1
  end
  true
  # temp = array.dup
  # # p "temp before trans: #{temp}"
  # temp[0] -= spread
  # # p "temp sub zero after spread: #{temp[0]}"
  # temp[1..-1].each_with_index do |v,i|
  #   # p "v: #{v}  i: #{i}   temp[i]: #{temp[i]}  array: #{temp}"

  #   if v + spread <= temp[i]
  #     p "in false return"
  #     p "value: #{v}  index: #{i} prev: #{temp[i]} "
  #     p "array as is: #{temp}"
  #     return false
  #   end
  #   temp[i] = [ (temp[i] +1), v - spread].max
  #   p "after a sucessfull transform: #{temp}"
  # end
  # true
end

def perfect_spread? array,spread
  if spread == 0
    return big_enough_spread? array, spread
  end
  # spread will work but spread- 1 won't
  if (big_enough_spread?(array,spread)) && (big_enough_spread?(array,spread-1))
    p "overshot the spread"
  end
  (big_enough_spread?(array,spread)) && !(big_enough_spread?(array,spread-1))
end

def crawl_array(array, spread = 0)
  p array.to_s
  count = 0
  until perfect_spread? array, spread
    transformed_array = [array[0]-spread]
    array[1..-1].each_with_index do |val, i|
      if val - transformed_array[i] + spread < 1
        spread = array[i] - array[i+1]
        break
      else
        transformed_array << [(transformed_array[i]+1), (val - spread)].max
      end
    end
    count += 1
    if count > 100
      p "hung process"
      break
    end
  end
  spread
end

def exp list
  return 0 if list.length < 2
  arr = list.dup
  spread = highest_to_low_spread arr
  while arr.length > 1
    high = index_of_highest arr
    low = (index_of_lowest arr[high..-1]) + high
    local_spread = first_last_length_spread arr[high..low]
    spread = [spread,local_spread].max
    # binding.pry
    arr = arr[0...high]
  end
  spread
end

def why_failed arr, spread
  return "spread of #{spread} is too small" unless big_enough_spread? arr, spread
  return "spread of #{spread} is not big enough" if big_enough_spread? arr, spread -1
  "I don't know what went wrong"
end

500.times do
  random_array = []
  100.times do
    random_array << rand(5)
  end
  spread = exp random_array
  unless perfect_spread? random_array, spread
    p '*' * 80
    p why_failed random_array, spread
    p "first_last_length_spread: #{first_last_length_spread random_array}"
    p "largest_one_gap_spread: #{largest_one_gap_spread random_array}"
    p "highest_to_low_spread: #{highest_to_low_spread random_array}"
    p "high_to_lowest_spread: #{high_to_lowest_spread random_array}"
    p "exp spread: #{exp random_array}"
    p random_array.to_s
    p '*' * 80
    p
    p
  end
  p spread
end

def x
  [79, 35, 62, 56, 66, 98, 58, 15, 45, 40, 4, 17, 68, 22, 72, 18, 12, 60, 1, 28, 58, 80, 84, 90, 94, 21, 52, 69, 16, 95, 61, 6, 71, 92, 64, 54, 23, 38, 16, 48, 33, 12, 51, 54, 98, 36, 42, 51, 46, 31, 35, 45, 38, 65, 0, 4, 41, 72, 66, 7, 42, 95, 17, 22, 32, 43, 4, 77, 18, 89, 76, 92, 84, 99, 59, 12, 64, 40, 36, 29, 1, 87, 84, 25, 63, 26, 48, 29, 77, 38, 0, 27, 45, 26, 36, 61, 74, 96, 64, 75]
end

# a = exp x
# p a
# p perfect_spread? x, a+1
# p perfect_spread? x, a
#      p why_failed x, a

