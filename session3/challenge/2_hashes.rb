# Given a nonnegative integer, return a hash whose keys are all the odd nonnegative integers up to it
# and each key's value is an array containing all the even non negative integers up to it.
# 
# Examples:
# staircase 1  # => { 1 => [] }
# staircase 2  # => { 1 => [] }
# staircase 3  # => { 1 => [], 3 => [2] }
# staircase 4  # => { 1 => [], 3 => [2] }
# staircase 5  # => { 1 => [], 3 => [2], 5 =>[2, 4] }

# first try :)
def staircase(n)
	return nil if n < 1
	hash = Hash.new

	1.upto(n).each do |num|
		if num.odd?
			hash[num] = 1.upto(num).select { |i| i.even? }
		end
	hash
end
