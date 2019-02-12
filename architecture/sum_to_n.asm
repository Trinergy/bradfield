# C Code
#include "stdio.h"
    
    # int main() {
    #     int n = 10;
    #     int total = 0;
        
    #     for (int i = 0; i <= n; i++)
    #         total += i;
        
    #     printf("Total is: %d\n", total);
    # }
.data
    total: .word 0
    n: .word 10
    i: .word 0
.text
main:
    lw $t0, total
    lw $t1, n
    lw $t2, i
loop:
    beq $t2, $t1, print_value
    add $t0, $t0, $t2
    addi $t2, 1
    j loop 
print_value:
    add $a0, $t0, $zero
    li $v0, 1
    syscall
    j end
end:
    li $v0, 10
    syscall