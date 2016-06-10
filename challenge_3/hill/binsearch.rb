def bin_search array, target
  start = 0
  last = array.count - 1
  # p "start: #{start}  last: #{last}"
  while last >= start
    mid = (last - start)/2 + start
    # p "start: #{start}  last: #{last}  mid:#{mid}  mid-value: #{array[mid]}  target: #{target}"
    if target > array[mid]
      # p "in larger"
      start = mid + 1
    elsif target < array[mid]
      # p "in smaller"
      last = mid - 1
    else
      return mid
    end
    # sleep 0.5
  end
  -1
end

arr = [1,3,9,11,15,19,29]
tar1 = 15
tar2 = 25

p bin_search arr, tar1
p bin_search arr, tar2
p bin_search arr, 0
p bin_search arr, 1
p bin_search arr, 30
p bin_search arr, 29

