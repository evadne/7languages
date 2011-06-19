#! /usr/bin/env io

keyboardInput := nil; answer := (Random value * 100) round
while ( (if (keyboardInput, (keyboardInput asNumber) != answer, true) ), 
	if (keyboardInput, writeln( if (keyboardInput asNumber > answer, "Lower.", "Higher.") ))
	keyboardInput := File standardInput readLine("Pick a number > ")
)

writeln ("Yes!")
