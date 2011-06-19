#! /usr/bin/env ruby
# Encoding: utf-8

require 'readline'

answer = rand(100), input = nil

while input != answer
	
	input = (Readline.readline('Guess a number from 0 to 100 > ', true)).to_i # This is without all the sanity checks
	puts "Higher." if (input < answer)
	puts "Lower." if (input > answer)
	
end

puts "Yep."
