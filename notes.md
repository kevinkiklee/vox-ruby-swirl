# NOTES!

* How should I parse the HTML
* Start thinking about nested html

```
<div class="paragraph-container">
	<p class="paragraph--green">Hello World</p>
	<p>Please click this <b>cheese</b> link</p>
</div>
```

* hmmmmmm....can i just work with pure string?
* no.  what if the css class has the keyword?  

* create a tree?  what is the proper data structure. 
* https://www.quora.com/What-is-the-best-way-to-parse-HTML
* no.  just use nokogiri.  
	- reason:  
		- rails should already have it
		- don't re-invent the wheel
		- nokogiri is better than anything i could write
		- proven package

* ermahgad, i've been stuck on replacing &gt; properly.  ughhhhhh.  small things whooping my butt.
* ughhhhhhhhhhhhhh, just found this in nokogiri doc: 
	* `to_s`, `to_html` - these methods will all emit properly-escaped markup
* FOUND IT.  REPLACE THE ESCAPE CHARS AFTER `to_html`.  WOOOOOOOOOOOOOOOO

* `money_making_html` method is too long.  needs refactor.  will return after writing the missing test

----------------

* need to validate that the string is a valid html document
* hmmm....simple tag matching using stacks and regex?  
* or do i want to simplify that farther and just check if the input and the output match? 
* actually rendering the page?  
* i already imported Nokogiri in.  do i want to use that to validate? 

* decision:  straight string match
	- time constraint
	- nokogiri auto-corrects.  cannot make it fail.  
	- if i had more time, i would like to have written an html parser

----------------

* What was the first thing you did after reading the exercises?
	- determine the objective
	- start thinking about complex html
	- decide on how to parse html
		- cannot just iterate over the string
		- what if the keyword is a css class name?
	- in short, explore the edge cases i have to consider

* Why did you chose this approach?
	- to think about how this code would be used at a production level.

* Tell us more about this architecture?
	- it uses nokogiri as the html parser

* What specific syntax decisions did you make?
  - more of a structure, but attempt to use only pure functions if possible

* Were there interesting optimizations you discovered?
	- this isn't necessarily discovered, but i thought about the time complexity of `money_making_html`. 
	- it is in o(m + n), with m being the number of html tags, and n being the number of words.  so O(n)

* What was the most difficult part of this exercise?
	- determining how to parse HTML

* What did you do when you got stuck?
	- gooooooogle
	- read nokogiri docs

* Did you learn anything new during this project?
	- nokogiri!

* What does your teammate need to know about it?
	- you need the HTML string and the DB object
	- returns the HTML string with the words linked

* Did you structure it in a way that is understandable to others?
	- the methods are organized in the order of execution

* Is it sufficiently documented?
	- Commented the purpose of the class, the necessary arguments, and lines that may need some explanation.

* Given more time, what would you do next to improve the project that you didn't have time for here?
	-	html parser
