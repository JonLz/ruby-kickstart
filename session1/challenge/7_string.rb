# given a string, return the character after every letter "r"
# 
# pirates_say_arrrrrrrrr("are you really learning Ruby?") # => "eenu"
# pirates_say_arrrrrrrrr("Katy Perry is on the radio!")   # => "rya"
# pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr")        # => "arrrrrrrr"

def pirates_say_arrrrrrrrr(string)
	str=""
	string.split(//).each_index do |i| 
		if /[Rr]/.match(string[i]) then 
			str << string[i+1] unless string[i+1] == nil
		end
	end
	str
end
