set l1 "1 2 3" # Define a list with three elements
#Output: "1 2 3"

set l2 {4 5 6} # Define another list with three elements using braces
#Output: "4 5 6"

set l3 [list 7 8 9] # Define a list using the list command
#Output: "7 8 9"

puts "List 1 is $l1, List 2 is $l2, List 3 is $l3" # Print all three lists
#Output: "List 1 is 1 2 3, List 2 is 4 5 6, List 3 is 7 8 9"

llength $l1 # Get the length of the first list
#Output: 3

lindex $l2 1 # Get the second element of the second list
#Output: 5

lindex $l3 end # Get the last element of the third list
#Output: 9

lindex $l3 end-1 # Get the second to last element of the third list
#Output: 8

lappend l1 10 11 # Append elements to the first list
#Output: "1 2 3 10 11"

set l4 {a b c} # Define a list with string elements using braces
#Output: "a b c"

lsort $l4 # Sort the string list
#Output: "a b c"

lsort -decreasing {3 1 2} # Sort a numeric list in decreasing order
#Output: "3 2 1"

lsort -increasing {3 1 2} # Sort a numeric list in increasing order
#Output: "1 2 3"

lsort -unique {1 2 2 3 1} # Sort and remove duplicates from a list
#Output: "1 2 3"

clear # Clear all defined variables
