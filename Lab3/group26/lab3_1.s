@ ARM Assembly - lab 3.1
@ Group Number :26
@ Roshan Ragel - roshanr@pdn.ac.lk
@ Hasindu Gamaarachchi - hasindu@ce.pdn.ac.lk

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	
mypow:
	MOV r2,#1      	  @hold the value of power and initialize to 1
	MOV r3,#1	      @i=1
	CMP r1,#0		  @compare value of n with 0
	BNE LOOP		  @if n!=0 go to loop
	MOV r0,#1
	MOV pc,lr		  
	LOOP:
		CMP r3,r1     @compare the value of i with arg2(n)
		BHI Exit   	  @Exit if i>n
		MUL r2,r0,r2  @power=power*x
		ADD r3,r3,#1  @increment the value of i
		B LOOP		  @go to loop
	Exit:
		MOV r0,r2	  @move the final value of r2(power) to r0
		MOV pc,lr     @return to caller


@ ---------------------	

	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value x
	mov r5, #3 	@the value n
	

	@ calling the mypow function
	mov r0, r4 	@the arg1 load
	mov r1, r5 	@the arg2 load
	bl mypow
	mov r6,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	mov r3, r6
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "%d^%d is %d\n"

