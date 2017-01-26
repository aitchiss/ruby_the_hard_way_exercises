filename = ARGV.first

puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTR-C (^C)."
puts "If you want that, hit RETURN."

$stdin.gets

puts "Opening the file..."
target = open(filename, 'w')

puts "Truncating the file. Goodbye!"
target.truncate(0)

puts "Now I'm going to ask you for three lines."

print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = $stdin.gets.chomp
print "line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file"

target.write(" #{line1} \n #{line2} \n #{line3} \n")
puts "And finally, we close it."
target.close

#this section didn't work before but I think it was because I hadn't closed the write version of the file (target). Seems to be fine in this order
puts "The file now reads: "
readfile = open(filename)
print readfile.read

