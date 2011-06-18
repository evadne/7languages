#! /usr/bin/env io

Matrix := Object clone do (

	store := nil

	initialize := method (x, y,
	
		writeln ("\nInitializing matrix of ", x , " by ", y, " as", self)
	
		listOf := method (items, filler, returned := List clone; for (index, 1, items, returned append(filler clone) ); returned)
		self store := listOf(x, listOf(y))
		
		return self
	
	)
	
	size := method ( if (store == nil, list(0, 0), list(store size, store at(0) size)))
	set := method (x, y, newValue, store at(x) atPut(y, newValue); self)
	get := method (x, y, store at(x) at(y))
	dump := method (store foreach (rowIndex, rowValue, rowValue foreach (colIndex, colValue, colValue print; "\t" print); writeln); self) 
	
	transposed := method (
	
		returned := Matrix clone initialize(self size at(1), self size at(0))
		store foreach (rowIndex, rowValue, rowValue foreach (colIndex, colValue, returned set(colIndex, rowIndex, colValue)))
		
		returned
	
	)
	
)


matrix := Matrix clone initialize( 20, 15 )
matrix set (5, 7, "Hi") set (3, 4, "Foo") set (1, 2, "Bar") set (1, 3, "Cat")
matrix dump
matrix transposed dump
