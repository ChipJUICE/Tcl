set i 0 # Initialize counter
#Output :0

while {$i < 10} {
    puts $i
    incr i
} # This loop will print numbers from 0 to 9
#Output :
#0
#1
#2
#3
#4
#5
#6
#7
#8
#9

set l1 { 1 2 3 4} # Define a list

foreach list_item $l1 { puts $list_item } # Iterate over list and print each item (commonly used)
#Output :
#1
#2
#3
#4
