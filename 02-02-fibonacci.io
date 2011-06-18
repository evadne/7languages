#! /usr/bin/env io

Fibonacci := (Object clone) do (

	recursive := method (number, 
	
		if (number < 2, return 1)
		return (self recursive (number - 1)) + (self recursive (number - 2))
		
	)
	
	looping := method (toIndex,
	
		currentIndex := 0; oldValue := 0; currentValue := 1; nextValue := 0
		
		while (currentIndex < toIndex,
		
			nextValue = oldValue + currentValue; oldValue = currentValue; currentValue = nextValue
			currentIndex = currentIndex + 1
		
		)
		
		return currentValue
	
	)
	
	algorithms := method ( return self slotNames )
	
)

for (index, 0, 30, 1, writeln("Looping Fibbonacci # ", index, " = ", Fibonacci looping(index)))
for (index, 0, 30, 1, writeln("Recursive Fibbonacci # ", index, " = ", Fibonacci recursive(index)))
