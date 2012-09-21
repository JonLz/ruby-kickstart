# Lets represent a file system with hashes
# You will be passed a hash table, whose keys represent folders.
# Their values will either be arrays of filenames in that directory
# or they will be hashes with the same rules (a treelike structure)
#
# Your job is to take the hashes, and return an array containing 
# all of the complete file paths where each directory is separated by a '/'
#
# HINT:
#   [1,2,3].is_a? Array # => true
#   [1,2,3].is_a? Hash  # => false
#   {1=>1}.is_a? Array  # => false
#   {1=>1}.is_a? Hash   # => true
#
# HINT2:
#   Don't feel constrained, you may create any methods, classes, etc, that 
#   you need to you may address the problem in any way you need to (I 
#   haven't tried it yet, but will probably use a recursive approach)
#
# EXAMPLES:
#
# pathify 'usr' => { 'bin' => [ 'ruby' ] }                                                            # => [ '/usr/bin/ruby' ]
# pathify 'usr' => { 'bin' => [ 'ruby' , 'perl' ] }                                                   # => [ '/usr/bin/ruby' , '/usr/bin/perl' ]
# pathify 'usr' => { 'bin' => ['ruby'] , 'include' => ['zlib.h'] }                                    # => [ '/usr/bin/ruby' , '/usr/include/zlib.h' ]
# pathify 'usr' => { 'bin' => ['ruby'] } , 'opt' => { 'local' => { 'bin' => ['sqlite3','rsync'] } }   # => [ '/usr/bin/ruby' , 'opt/local/bin/sqlite3' , 'opt/local/bin/rsync' ]
# pathify                                                                                             # => []
#
#
# create it from scratch :)

              
# Notes--
# I had to peek at the solution to wrap my head around recursion but then
# built up my solution from scratch based on the logic.. moral victory!

# strategy:
# recurse (1) hash->hash->files, (2) hash->files, (3) hash->hash->hash->files
# return => [(1) /dir/dir/file, (1) /dir/dir/file ... (3) dir/dir/dir/file]
# each file is an array element with the full parent path
# length of the array is the # of all files found
# recurse to build a parent path and then add all files with the parent path

# ex 'opt' => { 'local' => { 'bin' => ['sqlite3','rsync'] } }
def pathify(dirs)

# the final element inspected will be an array of files
# return an array of formatted files to append to the parent path string

return dirs.map { |file| "/" + file } if dirs.is_a? Array
# => ['/sqlite3', '/rsync']

paths = Array.new
dirs.each do |parent, child|
	parent_path = '/' + parent 	# create a parent path for each hash
								# /opt /local /bin
	child_path = pathify(child) # recurse to get to the files
								# this will be the formatted file array above
								# and return an array: 
	child_path.each do |file|
		paths << parent_path + file  	#[/bin/sqlite3, /bin/rsync]
										#[/local/bin/sqlite3, /local/bin/rsync]
										#etc
		end									
	end
return paths
end

# recursion is pretty great, 
# think backwards!