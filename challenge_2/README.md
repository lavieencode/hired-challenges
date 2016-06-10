<h2>Challenge 2: Braces</h2>

Given an array of three kinds of braces: round (), square [], and curly {}

**Your task is to**
<ul>
    <li>write a function that checks whether the braces in each string are correctly matched</li>
    <li>prints 1 to std output if the braces inn eacch string are matched, and 0 if they are not</li>
</ul>

Note that your function will receive the following arguments
<ul>
    <li>**expressions** - an array of strings containing braces</li>
</ul>

**Data constraints**
<ul>
    <li>the length of the array will not excceed 100 strings</li>
    <li>the length of any string will not exceed 5000</li>
</ul>

**Efficiency constraints**
<ul>
    <li>your function is expected to print the result in less than 2 seconds</li>
</ul>
<br><br><br>
<h3>Solution:</h3>
checking for a valid expression went as follows.  I would build the expression one brace at a time.  whenever the next brace in the expression queue (not a stack - used shift rather than pop) was an opening brace, I would push it onto a stack (built_expression).  Whenever the next brace was a closing brace, I would compare it to built_expression.pop.  if the type of closing brace matched its corresponding opening brace, I would continue the process.  If the brace types didn't match, the expression was invalid.  The way the logic was written, it seemed to work for all the edge cases I could think of - empty arrays, arrays having an odd number of elements, etc.

As far as complexity goes, I think it's a pretty straigt-forward O(n)
