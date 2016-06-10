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

def first_last_length_spread list
  return 0 if list.empty?
  first = list[0]
  last = list[-1]
  len = list.count
  total_distance = [0, (first - last + len - 1)].max
  (total_distance/2.0).ceil
end