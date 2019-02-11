# V = pi * r^2 * h
.data
  message1: .asciiz "Enter the radius of the cylinder: "
  message2: .asciiz "Enter the height of the cylinder: "
  pi: .float 3.14
  zeroAsFloat: .float 0.0

.text
main:
# Assign constants to float registers
lwc1 $f10, pi # pi
lwc1 $f11, zeroAsFloat

# User prompt for radius
li $v0, 4
la $a0, message1
syscall

# Read Float value entered by user
li $v0, 6
syscall

# Add user input $f0 to Zero Float and assign to $f1
add.s $f1, $f11, $f0 

# User prompt for height
li $v0, 4
la $a0, message2
syscall

# Read Float value entered by user
li $v0, 6
syscall

# Add user input $f0 to Zero Float and assign to $f2
add.s $f2, $f11, $f0 

# Compute Volume
mul.s $f3, $f1, $f1 # r^2
mul.s $f4, $f2, $f3  # r^2 * h
mul.s $f12, $f10, $f4 # pi * r^2 * h

# Print Float
li $v0, 2 
syscall

# Terminate program
li $v0, 10 
syscall