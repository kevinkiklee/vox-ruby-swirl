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


