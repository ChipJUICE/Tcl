# Tcl code demonstrating variable assignment and conditional statements
set a 5 # Set variable 'a' to 5
Output :5

if {$a==5} {puts "YES"} else {puts "NO"} # Check if 'a' equals 5 and print "YES" or "NO"
Output :YES

set b 10 # Set variable 'b' to 10
Output :10

if {$b==3} {puts "YES"} elseif {$b==5} {puts "MAYBE"} else {puts "NO"} # Check if 'b' equals 3, 5, or neither and print accordingly
Output :NO

# Define and use a procedure to add two numbers
proc plus {a b} {
    return [expr {$a + $b}] # Define a procedure 'plus' that returns the sum of 'a' and 'b'
}

puts [plus 3 4] # Call the 'plus' procedure with arguments 3 and 4 and print the result
Output :7

# Define and use a procedure to subtract two numbers
proc minus {a b} {
    return [expr {$a - $b}] # Define a procedure 'minus' that returns the difference of 'a' and 'b'
}
puts [minus 10 4] # Call the 'minus' procedure with arguments 10 and 4 and print the result
Output :6

# Define and use a procedure to multiply two numbers
proc multiply {a b} {
    return [expr {$a * $b}] # Define a procedure 'multiply' that returns the product of 'a' and 'b'
}
puts [multiply 3 4] # Call the 'multiply' procedure with arguments 3 and 4 and print the result
Output :12

# Define and use a procedure to divide two numbers
proc divide {a b} {
    return [expr {$a / $b}] # Define a procedure 'divide' that returns the quotient of 'a' and 'b'
}
puts [divide 12 4] # Call the 'divide' procedure with arguments 12 and 4 and print the result
Output :3
