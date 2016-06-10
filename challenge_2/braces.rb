require 'pry'

def braces expressions
  expressions.each do |expression|
    p is_valid_expression? expression
  end
end

def is_valid_expression? string
    expression_queue = string.split('')
    built_expression = []

    while !expression_queue.empty?
      new_brace = expression_queue.shift

      if opening_brace? new_brace
        built_expression << new_brace
      else
        return 0 unless (matching_parteners? built_expression.pop, new_brace)
      end
    end
    built_expression.empty? ? 1 : 0
end

def opening_brace? brace
  '([{'.split('').include? brace
end

def matching_parteners? opener, closer
  case opener
  when '('
    return closer == ')'
  when '['
    return closer == ']'
  when '{'
    return closer == '}'
  else
    false
  end
end


braces ['({{{}}}[[)]])']
braces ['(']


# p opening_brace? '('
# p opening_brace? '}'

# p matching_parteners? '(',')'
# p matching_parteners? ')', '('
# p matching_parteners? '(', '}'