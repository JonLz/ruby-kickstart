# Given a sentence, return an array containing every other word.
# Punctuation is not part of the word unless it is a contraction.
# In order to not have to write an actual language parser, there won't be any punctuation too complex.
# There will be no "'" that is not part of a contraction.
# Assume each of these  charactsrs are not to be considered: ! @ $ # % ^ & * ( ) - = _ + [ ] : ; , . / < > ? \ |
# 
# Examples
# alternate_words("Lorem ipsum dolor sit amet.")  # => ["Lorem", "dolor", "amet"]
# alternate_words("Can't we all get along?")      # => ["Can't", "all", "along"]
# alternate_words("Elementary, my dear Watson!")  # => ["Elementary", "dear"]

# Add a method to remove unwanted punctuation and whitespace
class String
	def clean
		cleaned = self.gsub(/[!@$#%^&*()-=_+\[\]:;,.\/<>?\|]/, ' ').squeeze(" ")
	end
end

# Clean the string, arrayify it, and then push every other character to the return array
def alternate_words(string)
	ary = []
	word_ary = string.clean.split(/ /)
	word_ary.each_index do |idx|
		ary.push(word_ary[idx]) if idx.even?
	end
	ary
end
