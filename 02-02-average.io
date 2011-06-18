#! /usr/bin/env io

List average := method (

	returned := 0
	self foreach (index, value, 
		
		if (value proto != Number, Exception raise (list("Object ", value, " at index ", index, " is not a number") join))
		returned = returned + value
		
	)
	
	returned / (self size)

)

list (2, 4, 5, 1, 40, 10) average print
list (2, 4, 5, 1, 40, 3, "Woof") average print
