# Write first_pos, a method which takes a string and , returns a hash
# whose keys are all the words in the string, and values are the
# earliest position they were seen in the string.
# 
# There will be no punctuation in the strings.
# 
# first_pos "The dog and the cat and the cow" # => { "The" => 0, "dog" => 1, "and" => 2, "the" => 3, "cat" => 4, "cow" => 7 }

# on a roll - another first try
def first_pos(string)
	hash = Hash.new

	# one note here is you can do split.each_with_index |word, index| to leverage
	# the index position in the original iterator instead of .index in the instructions
	# and you can also do hash[word] instead of hash.has_key?(word) - although I like
	# has_key as it seems more idiomatic
	
	string.split.each do |word|
		hash[word] = string.split.index(word) unless hash.has_key?(word)
	end
	hash
end