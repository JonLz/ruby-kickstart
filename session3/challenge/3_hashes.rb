# Write a method that takes a string and returns an array 
# whose keys are all the downcased words in the string, 
# and values are the number of times these words were seen.
# 
# No punctuation will appear in the strings.
# 
# Example:
# word_count "The dog and the cat" # => { "the" => 2, "dog" => 1, "and" => 1, "cat" => 1 }

# another first try!
def word_count(string)
	# define a word count hash with the default value being 0
	wc = Hash.new { |hash, key| hash[key] = 0}

	# add 1 to the value of each hash key for each time a word appears
	string.downcase.split(/ /).each { |word| wc[word] += 1 }

	wc
end