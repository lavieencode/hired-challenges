require './testing_data.rb'

def compare_lists first_words, second_words
  firsts = first_words.dup
  seconds = second_words.dup
  while !firsts.empty?
    p is_anagram? firsts.shift, seconds.shift
  end
end

def is_anagram? word1, word2
  return false unless word1.length == word2.length
  hash1 = build_histogram word1
  hash2 = build_histogram word2

  hash1.each do |k,v|
    return 0 unless v == hash2[k]
  end
  1
end

def build_histogram word
  word.split('').inject(Hash.new(0)){ |h,x| h[x] +=1; h}
end

list1 = ['cinema', 'host', 'aba', 'train']
list2 = ['iceman', 'shot', 'bab', 'rain']

# list1 = ['cinema']
# list2 = ['iceman']
data = make_word_list
compare_lists data[:first_words], data[:second_words]
