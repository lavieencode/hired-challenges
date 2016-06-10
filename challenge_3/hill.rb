def exp list
  return 0 if list.length < 2
  arr = list.dup
  spread = highest_to_low_spread arr
  while arr.length > 1
    high = index_of_highest arr
    low = (index_of_lowest arr[high..-1]) + high

    local_spread = first_last_length_spread arr[high..low]
    spread = [spread,local_spread].max

    arr = arr[0...high]
  end
  spread
end

def highest_to_low_spread list
  high      = index_of_highest list
  low       = index_of_lowest list[high..-1]
  sub_array = list[high..(low + high)]
  first_last_length_spread sub_array
end

def index_of_highest array
  temp = adjust_array_values_for_position_highest array

  max   = temp[0] #assigns initial max values
  index = 0
  temp.each_with_index do |val, i|
    if val > max
      max = val
      index = i
    end
  end
  index
end

def adjust_array_values_for_position_highest array
  temp = []
  array.each_with_index do |v,i|
    temp << v+(array.length - i)
  end
  temp
end

def index_of_lowest array
  temp = adjust_array_values_for_position_lowest array
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

def adjust_array_values_for_position_lowest array
  temp = []
  array.each_with_index {|v,i| temp << v-i}
  temp
end


def first_last_length_spread list
  return 0 if list.empty?
  first = list[0]
  last  = list[-1]
  len   = list.count
  total_distance = [0, (first - last + len - 1)].max
  (total_distance/2.0).ceil
end

p exp [1,2,3,4,5]
p exp [1,1,1,1,1,1]
p exp [6,5,4,3,2,1]