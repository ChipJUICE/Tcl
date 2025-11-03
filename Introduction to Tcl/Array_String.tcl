# Tcl script demonstrating associative arrays and string formatting
set courses(SOC) 1234 # Define an associative array entry
#Output :1234

set courses(VLSI) 5678 # Define another associative array entry
#Output :5678

puts $courses(SOC)  # Access and print the value associated with the key "SOC"
#Output :1234

array size courses  # Get the number of entries in the associative array
#Output :2

array name courses  # Get the name of the associative array
#Output :SOC VLSI

array get courses  # Get all key-value pairs in the associative array
#Output :SOC 1234 VLSI 5678

foreach coursename [array names courses] {
    puts "$coursename : $courses($coursename)"  # Iterate over keys and print key-value pairs
}
#Output :SOC : 1234
#VLSI : 5678

foreach {coursename coursecode} [array get courses] {
    puts "$coursename => $coursecode"  # Iterate over key-value pairs directly
}
#Output :SOC => 1234
#VLSI => 5678

format "%f" 40.25 # Format a floating-point number
#Output :40.250000

format "%.2f" 40.25 # Format a floating-point number with 2 decimal places
#Output :40.25

format "%e" 4025 # Format a number in scientific notation
#Output :4.025000e+03

format "%d\t%s" 56 $courses(VLSI) # Format an integer and a string with a tab separator
#Output :56    5678
