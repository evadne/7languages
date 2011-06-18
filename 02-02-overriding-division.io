#! /usr/bin/env io

//	Original
writeln ("30 / 0 = ", 30 / 0)

Number / := method (anotherNumber, return if (anotherNumber == 0, 0, (Number getSlot("/"))(anotherNumber)))

//	Overridden
writeln ("30 / 0 = ", 30 / 0)
