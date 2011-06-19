#! /usr/bin/env ruby
# Encoding: utf-8

require 'pp'

workingArray = []

for i in 0..15
	workingArray.push("item #{i}"	)
end

printedItems = []

puts "Printing using only Array.each:"
workingArray.each { |item|

	printedItems.push(item)
		
	if (printedItems.size == 4)
		pp printedItems
		printedItems = []
	end
	
}
pp printedItems	if (printedItems.size != 0)

puts "\n" "Printing using Enumeration.each_slice:"

workingArray.each_slice(4){ |aSlice| pp aSlice }

