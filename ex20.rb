input_file = ARGV.first

def print_all(f)
    puts f.read
end

def rewind(f)
    f.seek(0)
end

def print_a_line(line_count, f)
    puts "#{line_count}, #{f.gets.chomp}"
end

#we open the file we passed in when we ran the program - it's opened as read only by default
current_file = open(input_file)

puts "First let's print the whole file: \n"

#This runs the method we created above - which basically calls .read on the file passed to it, thus it prints out to screen
print_all(current_file)

puts "Now let's rewind, kind of like a tape."

#Not sure what the purpose of this is, but it looks for the 1st byte/character in the file (ie first letter). I don't think is does anything in this context??
rewind(current_file)

puts "Let's print three lines:"

#we set the current line number to 1, and then call the print_a_line method on the line number and the file. So it knows to look for line one, but I'm not sure how it knows to gets.chomp that particular line!
current_line = 1
print_a_line(current_line, current_file)

current_line += 1
print_a_line(current_line, current_file)

current_line += 1
print_a_line(current_line, current_file)

