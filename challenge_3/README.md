<h2>Challenge 3: Hill</h2>

Given an array of integer elements

**Your task is to**
<ul>
    <li>write a function that finds the minimum value X that makes it possible the following: generate a new array that is sorted in stricctly ascendinng order by increasing or deccresing eaccch of the elements of the initial array with interger values in the [0,X] range</li>
    <ul>
        <li>Example: Having the initial array [5,4,3,2,8], the minimum value for X is 3. Deccrease the first element (5) by 3, decrease the seconnd element (4) by one, innccrease the third one (3) by 1, increase the fourth element (2) by 3, and do nothing to the last one (8).  In the end we obtain the array [2,3,4,5,6] which is sorted in strictly asccending order.</li>
    </ul>
    <li>print the result X to the standard output</li>
</ul>

Note that your function will receive the following arguments
<ul>
    <li>**v** - an array of inntegers</li>
</ul>

**Data constraints**
<ul>
    <li>numbers are inn asccccenndinng order whenn arranged from the smallest to the largest number</li>
    <li>stricctly ascending order means that each elemennt is greater thann the precceding one (e.g. [1,2,2,3,4] is not stritly asccending order)</li>
    <li>the length of the array will not excceed 5000</li>
    <li>the elemennts of any of the arrays are integer numbers in the [1, 2^31 -1] range</li>
</ul>

**Efficiency constraints**
<ul>
    <li>your function is expected to print the result in less than 2 seconds</li>
</ul>
<br><br><br>
<h3>Solution:</h3>