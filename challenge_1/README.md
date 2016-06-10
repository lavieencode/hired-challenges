Challenge 1: ANAGRAMS

given a list of word pairs,

**Your task is to**:
<ul>
    <li>write a function that determines for each word pair if it's an anagram or not.</li>
    <li>for each pair of words your funcction will print to standard output the value 1 if the pair is an anagram, or 0 otherwise (one result per line)</li>
</ul>

Note that your function will receive the following arguements:
<ul>
    <li> **first_words** - an array of strinngs giving the first word for each of the pairs
    </li>
    <li>**second_words** - an array of strings giving the second corresponding word</li>
</ul>

**Data constraints**
<ul>
    <li>the number of word pairs will not exceed 100</li>
    <li>the maximum length of any word is 100 characters</li>
    <li>all the words will contain only lower case English letters (a-z)</li>
</ul>

**Efficiency constraints**
<ul>
<li>your function is expected to print the results in less than 2 seconds</li>
</ul>

**Solution**:
My first brute force instinct was to simply sort both (split into an array) words and look for equality/inequality when popping from both arrays.

Greater efficiency can be attained by building a histogram (in a hash) for all the chars in both words.  side by side comparisons can be made by looping through one hash-map and making sure the other map matches all keys and values.

Implementing this soulution brings the time complexity down from O(n * log n) to O(n).
