#Tripp Herlong
#       ECE 4290/6290 Lab 2

        .globl  main

        .text
main:   
        
        # read one integer from the console and 
        # print the number in binary 
 
        # use system call 5 to read integer
        addi    a7, x0, 5
        ecall
        addi    s1, a0, 0

        # use system call 35 to print a0 in binary
        # a0 has the integer we want to print
        addi    a7, x0, 35
        ecall

        # TODO
        # Add you code here
        #   print newline
        #   print 32 bits in s1, using a looop
        #   print newline
        
        lui t0,0x80000
        addi t2,zero,32
        
        #coe for a new line
        addi a7,x0,11
        addi a0,x0,'\n'
        ecall
        
while_loop:
	
	and t1,s1,t0
	bne t1,zero,p_one

p_zero: #function to print zero

       li a7,10
       li a0,0x0
       li a7,1
       ecall
       beq zero,zero,shift  
p_one: #function to print one

       li a7,10
       li a0,0x1
       li a7,1
       ecall         
       li,t1,0x0
       
shift: #print bits from most significant to least significant until all bits are printed
       srli t0,t0,1
       bne t0,zero,while_loop
