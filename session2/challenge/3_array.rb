# Write a method named every_other_char for strings that, 
# returns an array containing every other character
# 
# example:
# "abcdefg".every_other_char  # => "aceg"
# "".every_other_char         # => ""

class String
	def every_other_char
		
		# Return blank if it's an empty string
		return "" if self.length == 0

		# Initialize the string	and loop through
		# every character and add it to str if it's index
		# position is even
		str=""

		(0..(self.length-1)).each do |idx|
			str << self[idx] if idx.even?
		end

		# Return the string
		str
	end

end