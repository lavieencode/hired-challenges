

def generate_word length=nil
  word = ''
  length ||= rand(50) + 51
  length.times {word << @char_array.sample}
  word
end

def generate_anagram word
  word.split('').shuffle.join
end

def make_word_list
  # returns an object containing first and second word arrays, along with the total num of anagram pairs and non-anagram pairs.
  # 51-100 word pairs of 51 - 100 characters in length
  first_words = []
  second_words = []

  total_pairs = rand(50) + 51
  anagram_pairs = rand(0..total_pairs)
  non_anagram_pairs = total_pairs - anagram_pairs
  @char_array = ('a'..'z').to_a

  anagram_pairs.times do
    word = generate_word
    first_words << word
    second_words << (generate_anagram word)
  end

  non_anagram_pairs.times do
    word = generate_word
    first_words << word
    second_words << (generate_word word.length)
  end
  {   first_words: first_words,
      second_words: second_words,
      num_anagrams: anagram_pairs,
      num_non_anagrams: non_anagram_pairs
    }
end

anag = make_word_list
# p anag.first_words
# p anag.second_words
# p anag.anagram_pairs
# p anag.non_anagram_pairs
# p anag[:first_words]










