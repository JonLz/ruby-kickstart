# Write a method named prime_chars? which takes array of strings
# and returns true if the sum of the characters is prime. 
# 
# Remember that a number is prime if the only integers that can divide it with no remainder are 1 and itself. 
# 
# Examples of length three
# prime_chars? ['abc']            # => true
# prime_chars? ['a', 'bc']        # => true
# prime_chars? ['ab', 'c']        # => true
# prime_chars? ['a', 'b', 'c']    # => true
# 
# Examples of length four
# prime_chars? ['abcd']           # => false
# prime_chars? ['ab', 'cd']       # => false
# prime_chars? ['a', 'bcd']       # => false
# prime_chars? ['a', 'b', 'cd']   # => false


def prime_chars?(array)

	# No array no cry
	return false if array == []

	# Get the prime number to test!
	prime = array.map { |char| char.length }.reduce(:+)

	# Anything less than 2 is not a prime number (0, 1)
	return false if prime < 2 

	# Test for non primality 
	(2..(prime/2)).each { |i| return false if (prime % i) == 0 }
		
	# Number must be a prime
	return true
end
