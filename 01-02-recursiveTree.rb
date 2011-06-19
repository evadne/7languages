#! /usr/bin/env ruby
# Encoding: utf-8

require 'pp'

class Tree
	attr_accessor :children, :node_name
	def initialize(name, children=[])
		@children = children
		@node_name = name
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end
	def visit(&block) block.call self
	end
end

implicitTree = Tree.new(
	"Ruby", [
		Tree.new("Reia" ),
		Tree.new("MacRuby")
	]
)

puts "Visiting a node"
implicitTree.visit {|node| puts node.node_name }
puts

puts "Visiting entire tree"
implicitTree.visit_all { |node| puts node.node_name }





puts
puts





class RecursiveTree < Tree
	def initialize (aHash)
		
		onlyKey = aHash.keys[0]
		@node_name = onlyKey
		@children = []
		
		aHash[onlyKey].each {|key, value| 
			@children.push(RecursiveTree.new({ key => value }))			
		}
		
	end
end

recursiveTree = RecursiveTree.new({
	"grandpa" => {
		'dad' => {
			'child 1' => {}, 
			'child 2' => {}
		}, 
		'uncle' => {
			'child 3' => {},
			'child 4' => {}
		}
	}
})

puts "Visiting a node"
recursiveTree.visit {|node| puts node.node_name }

puts

puts "Visiting entire tree"
recursiveTree.visit_all { |node| puts node.node_name }
