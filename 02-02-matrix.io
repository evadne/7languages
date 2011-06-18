#! /usr/bin/env io

Matrix := Object clone do (

	store := nil

	initialize := method (x, y,
	
		writeln ("Initializing matrix of ", x , " by ", y, " as", self)
	
		listOf := method (items, filler, 
			returned := List clone; for (index, 1, items, returned append(filler clone) );
			return returned
		)
		
		store = listOf(x, listOf(y))
		return self
	
	)
	
	size := method (
		
		return if (store == nil, list(0, 0), list(store size, store at(0) size))
	
	)
	
	set := method (x, y, newValue,
	
		store at(x) atPut(y, newValue)
	
	)
	
	get := method (x, y,
	
		return store at(x) at(y)
	
	)
	
	dump := method (
	
		store foreach (rowIndex, rowValue,
		
			rowValue foreach (colIndex, colValue,
			
				colValue print
				"\t" print
			
				//	writeln ("[ ", rowIndex, ", ", colIndex, " ] = ", colValue)
			
			)
			
			writeln
		
		)
		
		"" println
	
	) 
	
	transposed := method (
	
		ownSize := self size
		returned := Matrix clone initialize(ownSize at(1), ownSize at(0))
		
		self store foreach (rowIndex, rowValue, rowValue foreach (colIndex, colValue, returned set(colIndex, rowIndex, colValue)))
		
		return returned
	
	)
	
)


matrix := Matrix clone initialize( 20, 15 )
matrix dump
matrix transposed dump

