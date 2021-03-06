# Print to stdout, each element in a hash based linked list.
# If you don't know what that is, go check out the previous problem.
# 
# EXAMPLES:
# head = { :data => 1, :next => nil }
# print_list head                             # >> "1\n"
# head = { :data => 2, :next => head }
# print_list head                             # >> "2\n1\n"
# head = { :data => 3, :next => head }
# print_list head                             # >> "3\n2\n1\n"
# head = { :data => 4, :next => head }
# print_list head                             # >> "4\n3\n2\n1\n"
# head = { :data => 5, :next => head }
# print_list head                             # >> "5\n4\n3\n2\n1\n"
# head = { :data => 6, :next => head }
# print_list head                             # >> "6\n5\n4\n3\n2\n1\n"

# 
# Uh, oh Shooter.. looks like someone learned how to use recursion
#
# ..which probably isn't the most efficient solution, but it sure is instructive..
#
# ..but hey maybe we'll need it another day, or we can lay by the bay, make things out of clay, we just may, whaddya say?
#
#  Well look at that, it did come in useful.

# Build an array of data based on a hashed linked list by recursing through the list
def link_to_array(head)
	to_ret = Array.new
	to_ret << head[:data] if head[:next] == nil
	if head[:next].is_a? Hash then 
		to_ret << head[:data]
		to_ret << link_to_array(head[:next])
	end
	to_ret.flatten
end

# Return the middle value of the arrayified linked list
def print_list(head)
	link_to_array(head).each { |v| puts v }
end


#non-recursive solution
def non_recurse (list)
	while list
	  puts list[:data]
	  list = list[:next]
	end
end

