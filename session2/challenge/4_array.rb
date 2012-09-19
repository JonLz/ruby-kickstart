# Write a method named get_squares that takes an array of numbers
# and returns a sorted array containing only the numbers whose square is also in the array
# 
# get_squares [9]                      # => []
# get_squares [9,3]                    # => [3]
# get_squares [9,3,81]                 # => [3, 9]
# get_squares [25, 4, 9, 6, 50, 16, 5] # => [4, 5]

def get_squares(unsquared)		
	# Check if the square of each element is included in the array
	has_squares = []						
	unsquared.each do |i|
		has_squares.push(i) if 			
		unsquared.include?(i**2)
	end

	# Sort and return the array
	has_squares.sort
end