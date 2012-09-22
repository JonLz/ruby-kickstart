# You have two different problems to solve, you must get which one it is from a hash
# The default value for the hash should be :count_clumps
# (hint:  var.is_a? Hash)
#
# PROBLEM: count_clumps
# Say that a "clump" in an array is a series of 2 or more adjacent elements of the same value. 
# Return the number of clumps in the given arguments.
# problem_14 1, 2, 2, 3, 4, 4   , :problem => :count_clumps    # => 2
# problem_14 1, 1, 2, 1, 1      , :problem => :count_clumps    # => 2
# problem_14 1, 1, 1, 1, 1      , :problem => :count_clumps    # => 1
#
# I can also bypass your problem_14 method and go directly to count_clumps as so:
# count_clumps 1, 2, 2, 3, 4, 4     # => 2
# count_clumps 1, 1, 2, 1, 1        # => 2
# count_clumps 1, 1, 1, 1, 1        # => 1
#
#
# PROBLEM: same_ends
# return true if the group of N numbers at the start and end of the array are the same. 
# For example, with [5, 6, 45, 99, 13, 5, 6], the ends are the same for n=0 and n=2, and false for n=1 and n=3. 
# You may assume that n is in the range 0..nums.length inclusive.
# 
# The first parameter will be n, the rest will be the input to look for ends from
# problem_14 1, 5, 6, 45, 99, 13, 5, 6   , :problem => :same_ends    # => false
# problem_14 2, 5, 6, 45, 99, 13, 5, 6   , :problem => :same_ends    # => true
# problem_14 3, 5, 6, 45, 99, 13, 5, 6   , :problem => :same_ends    # => false
#
# I can also bypass your problem_14 method and go directly to same_ends as so:
# same_ends 1, 5, 6, 45, 99, 13, 5, 6    # => false
# same_ends 2, 5, 6, 45, 99, 13, 5, 6    # => true
# same_ends 3, 5, 6, 45, 99, 13, 5, 6    # => false


def problem_14(*args)
	hash = if args[-1].is_a? Hash then args.pop else nil end
	problem = if hash then hash[:problem].to_s else "count_clumps" end

	return same_ends(args[0], args[1..(args.length-1)]) if problem == "same_ends"
	return count_clumps(args) if problem == "count_clumps"
end

def same_ends(n,*args)
	return true if n == 0
	args = args.flatten
	args[0..n-1] == args[(args.length-n)..(args.length)]	
end

def count_clumps(*args)
	args = args.flatten
	#[1,1,2,1,1]
	count = Array.new
	a = Array.new
	args.each_with_index do |val, idx|
	      if idx == 0 then next
	      elsif val == args[idx-1]
		a << val
		count << a if a.length >> 0 && idx == args.length - 1
	      elsif val != args[idx-1]
		count << a if a.length > 0
		a = Array.new
	      end
	end
	count.length
end


#p problem_14(2,5,6,45,99,13,5,6, {:problem => :same_ends})
#p problem_14(1,1,1,1,4,4,4,3,3,1,7,8,8, {:problem => :count_clumps})
#p problem_14(1,1,2,1,1)

