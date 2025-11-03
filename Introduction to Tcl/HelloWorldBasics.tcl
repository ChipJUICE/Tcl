puts "Hello, World!" # This line prints "Hello, World!" to the console
#Output:Hello, World!

puts "Hello,"; puts "World!" # This prints "Hello," and "World!" on separate lines
#Output:Hello,
#World!

set a 5 # This line sets the variable 'a' to 5
#Output:5

puts $a # This line prints the value of 'a'
#Output:5

puts a # This line prints the string 'a'
#Output:a

puts "$a" # This line prints the value of 'a'
#Output:5

puts "\$a" #This line prints the string '$a'
#Output:$a

puts ${a}4 # This line prints the value of 'a' followed by '4'
#Output:54

puts"2+2" # This line prints the string '2+2'
#Output:2+2

puts [expr 2+2] # This line evaluates the expression 2+2 and prints the result
#Output:4

set b [expr $a * 2] # This line sets the variable 'b' to the value of 'a' multiplied by 2
#Output:10

puts $b # This line prints the value of 'b'
#Output:10

puts "The value of a is $a and the value of b is $b." # This line prints a formatted string with the values of 'a' and 'b'
#Output:The value of a is 5 and the value of b is 10.

puts "The sum of a and b is [expr $a + $b]." # This line prints the sum of 'a' and 'b'
#Output:The sum of a and b is 15.

puts "The product of a and b is [expr $a * $b]." # This line prints the product of 'a' and 'b'
#Output:The product of a and b is 50.

puts "Goodbye, World!" # This line prints "Goodbye, World!" to the console
#Output:Goodbye, World!


