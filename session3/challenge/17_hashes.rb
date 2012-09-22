# Print to stdout, each element in a hash based linked list, in reverse.
# If you don't know what that is, go check out the previous problem.
# 
# EXAMPLES:
# head = { :data => 1, :next => nil }
# head = { :data => 2, :next => head }
# 
# print_list_in_reverse head            # >> "1\n2\n"
#
# 
#
def link_to_array(head)
	to_ret = Array.new
	to_ret << head[:data] if head[:next] == nil
	if head[:next].is_a? Hash then 
		to_ret << head[:data]
		to_ret << link_to_array(head[:next])
	end
	to_ret.flatten
end

def print_list_in_reverse(head)
	link_to_array(head).reverse.each { |v| puts v }
end


