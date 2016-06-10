
zeros = [0,0,0,0,0,0,0,0,0]
zeros_even = [0,0,0,0,0,0,0,0,0,0]
ascend = [1,2,3,4,5,6,7,8,9]
ascend_even = [1,2,3,4,5,6,7,8,9,10]
descend = [9,8,7,6,5,4,3,2,1]
descend_even = [10,9,8,7,6,5,4,3,2,1]
alternate = [1,9,2,8,7,3,5,4,6]
alternate_even = [1,9,2,10,8,7,3,5,4,6]




def hill_solver array, initial_span = nil
  unless initial_span
    span = [(first_last_spread array), (max_gap_spread array)].max
  end



  if solution_tester(array, span)
    return span
  else
    truncated_array = isolate_array_component array, span
    return hill_solver truncated_array
  end
end

def isolate_array_component array, span
end



def peak_trough_spread  array
  high = {'value' => array[0], 'index' => 0}
  low = {'value' => array[0], 'index' => 0}
  p array[0]
  p high
  array.each_with_index do |val, index|
    if val > high['value']
      high['value']  = val
      high['index'] = index
    elsif val <= low['value']
      low['value'] = val
      low['index'] = index
    end
    # p "high: #{high['value']} index: #{high['index']} XXXX low: #{low['value']} index: #{low['index']}"
  end
  wave_length = high['index'] - low['index']
  amplitude = high['value'] - low['value']
  p wave_length
  p amplitude
end

class HillSolver

  def initialize initial_array
    #
    @initial_array = initial_array
  end

  def solve
    high = {'value' => @initial_array[0], 'index' => 0}
    low = {'value' => @initial_array[0], 'index' => 0}
    @initial_array[0...-1].each_with_index do |val, index|
      if val > high['value']
        high = {'value' => val, 'index' => index}
        low = {'value' => val, 'index' => index}
        #  ^^ we want the lowest value AFTER the highest value
      elsif val <=  low['value']
        low = {'value' => val, 'index' => index}
      end
      p "high: #{high['value']} high_index: #{high['index']} low: #{low['value']}  low:index: #{low['index']}"
    end
  end

  private
  def find_max array=@initial_array
  end

  def no_repeats? array

    array.length == array.uniq.length
  end

  def ascending? array
    array[0...-1].each_with_index do |val, index|
      return false if val >= array[index+1]
    end
    true
  end

  def solution_tester spread
    arr = @initial_array.dup
    arr[0] -= spread
    arr[1..-1].each_with_index do |val, i|
      index = i +1
      prev = arr[index - 1]
      if val <= prev
        if prev  >= val + spread
         return false
        else
          arr[index] = prev +1
        end
      elsif val > prev + spread
        arr[index] = val - spread
      else
        arr[index] = prev + 1
      end
    end
    # p "final array: #{arr.to_s}"
    return (no_repeats? arr) && (ascending? arr)
  end

  def confirm_exact_answer spread

    (solution_tester @initial_array, spread) && !(solution_tester @initial_array, spread-1)
  end

  def first_last_spread array
    span = 1 + array[-1] - array[0] - array.length
    p "1st/last spread: #{(span > 0 ? 0 : span/-2)}"
    return (span > 0 ? 0 : span/-2)
  end

  def max_gap_spread array
    max = 0
    array[0...-1].each_with_index do |val, index|
      span = array[index+1] - val
      if span > 0
        truespan = 0
      else
        truespan = ((span.abs + 1)/2.0).ceil
      end
      max = [max,truespan].max
    end
    p "gap spread: #{max}"
    max
  end
end

# test = []
# 10.times { test << rand(50) }
# p test.to_s

# ms = [(first_last_spread test), (max_gap_spread test)].max
# p confirm_exact_answer test, ms

bob = HillSolver.new [1,-10,443,2,8,45,8,9,443,-10,6]
bob.solve




