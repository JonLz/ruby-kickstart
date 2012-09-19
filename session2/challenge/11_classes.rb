# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method 
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.

class BeerSong
	attr_accessor :bottles

	# initialize the object and give it a correct number of bottles
	def initialize(bottles)
		if bottles < 0 then bottles = 0
		elsif bottles > 99 then bottles = 99
		end
		self.bottles = bottles
	end

	# print the stanzas, translating numbers to English and pluralizing bottles using bottle method
	def stanza(bottles)
		puts "#{translate bottles} #{bottle bottles} of beer on the wall,"
		puts "#{translate bottles} #{bottle bottles} of beer," 

		puts "Take one down, pass it around,"
		puts "#{translate bottles-1} #{bottle bottles-1} of beer on the wall."
	end

	# pluralize the number of bottles as necessary
	def bottle(n)
		n == 1 ? "bottle" : "bottles"
	end

	# prints the song, returning an empty string if bottles is zero
	def print_song
		if self.bottles == 0 then return "" end
		while self.bottles > 0
			stanza(self.bottles)
			self.bottles -= 1
		end
	end

	# translate a number from 0 - 99 to English
	def translate(n)
		# create word arrays
		tens = %w(. . twenty thirty forty fifty sixty seventy eighty ninety)
		teens = %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
		ones = %w(zero one two three four five six seven eight nine ten)

		# double digits
		# selects the correct string index from the word arrays based on the number
		if n >= 20 then
			str = tens[n/10].capitalize
			if n % 10 != 0
				str << "-" 
				str << ones[n%10]
			end
			return str
		end

		if n >= 10 && n <= 19 then
			return teens[n%10].capitalize
		end

		# single digits
		if n <= 9 then
			ones[n].capitalize
		end
	end

end
