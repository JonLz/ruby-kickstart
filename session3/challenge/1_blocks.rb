# Write a method, reverse_map, which invokes a block on each of the elements in reverse order,
# and returns an array of their results.
# 
# reverse_map( 1, 2, 3 ) { |i| i * 2 }      # => [6, 4, 2]

# so apparently &block is just a Proc, so we can just use 
# &block next time instead of calling 2 blocks
def reverse_map(*num, &block)
	num.reverse.map { |num| block.call num}
end