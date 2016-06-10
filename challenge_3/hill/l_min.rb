# class HillSolver
#   attr_accessor :list
#   class HillElement
#     attr_accessor :value, :index

#     def initialize value, position
#       @value = value
#       @index = position
#     end
#   end

#   def initialize array
#     @list = create_list array
#   end

#   def solve

#   end

#   #private
#   def create_list array
#     max = array.max
#     while array[-1] == max
#       array.pop
#     end
#     list = array.each_with_index.map { |val, index| HillElement.new(val, index) }

#   end

#   def find_max
#     max = HillElement.new(list[0].value, list[0].index)
#     list.each do |element|
#       if element.value > max.value
#         max = element
#       end
#     end
#     max
#   end

# end

# x = HillSolver.new [1,2,3,4,5,4,3,2,1,12,6,6]
# p x.find_max.value



# find baseline min_spreads - either high/low gap differential or start - end - length or highest to next lowest spread

#  feed largest result into solver  which attempts to run puzzle from left to right using min spread
# if attempt fails, calculate what the min-spread must be to clear the next hurdle,and rerun
# repeat til puzzle is solved

ascend1 = [1,2,3,4,5,6,7,8,9]
ascend2 = [1,2,3,4,5,6,7,8,9,10]
descend1 = ascend1.reverse
descend2 = ascend2.reverse
flat1 = [0,0,0,0,0,0,0,0,0]
flat2 = [0,0,0,0,0,0,0,0,0,0]

class HillSolver
  attr_accessor :list, :min-spread

  def initialize array
    @list = array
    @min_spread = 0
  end

  def solve
  end

  private
  def calculate_initial_min_spread
    # returns integer of largest initial minspread calculation
    [first_last_length_spread,
      largest_one_gap_spread,
      highest_to_lowest_spread].max
  end

  def first_last_length_spread
    first = list[0]
    last = list[-1]
    len = list.count
    total_distance = [0, first - last + length - 1].max
    (total_distance/2.0).ceil
  end

  def largest_one_gap_spread

  end

  def highest_to_lowest_spread

  end

end