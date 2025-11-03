# Tcl code to create a file and write "Hello, World!" into it
set fh [open "input.txt" w] # Open a file "input.txt" for writing and assign the file handle to 'fh'

puts $fh "Hello, World!"      # Write the string "Hello, World!" to the file
close $fh                     # Close the file handle

#Output: The code creates a file named "input.txt" and writes "Hello, World!" into it. 

# Tcl code to append a new line to the existing "input.txt" file
set fh [open "input.txt" a] # Open the file "input.txt" for appending
puts $fh "This is an appended line." # Append a new line to the file
close $fh                     # Close the file handle

#Output: The code appends the line "This is an appended line." to the existing "input.txt" file.

# Tcl code to read and print the first line from the "input.txt" file
set fh [open "input.txt" r] # Open the file "input.txt" for reading
gets $fh oneline         # Read the first line from the file
puts $oneline            # Print the first line to the console
#Output: The code reads and prints the first line of the "input.txt" file, which is "Hello, World!".
close $fh                     # Close the file handle

# Tcl code to read and print all lines from the "input.txt" file
set fh [open "input.txt" r] # Open the file "input.txt" for reading
while {[gets $fh oneline] >= 0} {
    puts $oneline              # Print each line to the console
}
close $fh                     # Close the file handle
#Output: The code reads and prints all lines of the "input.txt" file to the console.

# Tcl code to read the entire content of the "input.txt" file at once
set fh [open "input.txt" r] # Open the file "input.txt" for reading
set data [read $fh]        # Read the entire content of the file
#Outputs: The code reads the entire content of the "input.txt" file and stores it in the variable 'data'.

 puts $data                 # Print the entire content to the console
# Output: The code prints the entire content of the "input.txt" file to the console.

close $fh                     # Close the file handle
