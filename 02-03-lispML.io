#! /usr/bin/env io

OperatorTable addAssignOperator(":", "atPut") 

Object do (
	
	curlyBrackets := method (
		returned := Map clone
		call message arguments foreach(aMessage, returned doString(aMessage asString))
		returned
	)
	
	: := method ( self )
	
)


Map do (

	asAttributesString := method ( usesDoubleQuotes,
	
		quoteWrap := if (usesDoubleQuotes == true, "\"", "")
	
		returnedItems := list()
		self foreach (key, value, 
			returnedItems append(
				list(
					" ",
					quoteWrap, key asString asMutable removePrefix("\"") removeSuffix("\""), quoteWrap,
					"=", 
					"\"", value asString asMutable removePrefix("\"") removeSuffix("\""), "\""
				) join
			)
		)
		
		returnedItems join(" ")
		
	)

)


Sequence do (

	asPartialOpeningTagPrefix := method ( attributes, list( "<", self ) join )
	asPartialOpeningTagSuffix := method ( ">" ) 
	asFullClosingTag := method ( list( "</", self, ">" ) join )
	
)


LispMLNode := Object clone do (

	//	Putting them here efficiently makes them class (prototype) variables
	//	name := nil
	//	attributes := {}
	//	children := list()
	//	text := nil
	
	dump := method (
	
		returnedString := list()
	
		returnedString append(name asPartialOpeningTagPrefix)
		returnedString append(attributes asAttributesString)
		
		returnedString append(name asPartialOpeningTagSuffix)
		
		if (children size > 0, returnedString append("\n"))
		children foreach (index, aChild, 
			returnedString append(list("\t", (aChild dump split("\n") join("\n\t")), "\n" ) join)
		)

		returnedString append(name asFullClosingTag)
		returnedString append("\n")
		
		returnedString join
		
	)
	
)


LispMLBuilder := Object clone do (

	forward := method(
	
		returnedNode := LispMLNode clone
		returnedNode name := call message name asString
		returnedNode attributes := {}
		returnedNode children := list()
		returnedNode text := nil
		
		call message arguments foreach(index, aMessage,
			content := self doMessage(aMessage)
			if (content type == "Map", returnedNode attributes = content )
			if (content type == "LispMLNode", returnedNode children append(content) )
			if (content type == "Sequence", returnedNode text = content )
		)
		
		returnedNode
		
	)
	
)




builtNode := LispMLBuilder ul({"Testing": "Yep"},

	li("First Thing"),
	bar({"guard": true}, "testie",
	
		video({"src": "http://google.com"})
	
	)
	
)

builtNode dump print
