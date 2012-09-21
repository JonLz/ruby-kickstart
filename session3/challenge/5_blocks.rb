# Write a method, spiral_access, that takes a 2d square array (an array of arrays)
# and a block, and calls the block for each of the elements, in spiral order.
# 
# HINT: This method is probably best sovled recursively
# 
# Example:
# twoD = [
#   [  1 ,  2 ,  3 ,  4 , 5 ], 
#   [ 16 , 17 , 18 , 19 , 6 ], 
#   [ 15 , 24 , 25 , 20 , 7 ], 
#   [ 14 , 23 , 22 , 21 , 8 ], 
#   [ 13 , 12 , 11 , 10 , 9 ],
# ]
# order = []
# spiral_access twoD do |i|
#   order << i
# end
# order # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]

def spiral_access(arrayset, i=0, &block) # i = iterator

	# special cases
	return nil if arrayset == [[]]
	return block.call arrayset[0][0] if arrayset == [[1]]

	# get the length of the array
	length = (arrayset.length) - 1

	return if length/2 < i

	# Upper bound (square of 5x5)
	# 0: traverse 0,0 to 0,4
	# => i,i to i, length-i
	(i).upto(length-i) do |x|
	  block.call arrayset[i][x] 
	end

	# Right bound (square of 5x5)
	# 0: traverse 1,4 to 3,4
	# => i+1, length-i to length-i, length - i
	(i+1).upto(length-i) do |y|
	  block.call arrayset[y][length-i]
	end

	# Lower bound (square of 5x5)
	# 0: traverse 4,4 to 4,0
	# => length-i, length-i to length-i, i
	(length-i-1).downto(i) do |x|
	  block.call arrayset[length-i][x]
	end

	# Left bound (square of 5x5)
	# 0: traverse 3,0 to 1,0
	# => length-1-i, i to i+1, i
	(length-1-i).downto(i+1) do |y|
		block.call arrayset[y][i]
	end

	# recursive call to work one layer closer to center until center
	spiral_access(arrayset, i+1, &block)
end
