# V = pi * r^2 * h
main:
li.s $f0, 3.14 # pi
li.s $f1, 10.0 # radius
li.s $f2, 5.0 # height

mul.s $f3, $f1, $f1 # r^2

mul.s $f4, $f2, $f3  # r^2 * h

mul.s $f12, $f0, $f4 # pi * r^2 * h

li $v0, 2
syscall