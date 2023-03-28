@ ARM Assembly - exercise 6 
@ Group Number :26

	.text 	@ instruction memory
	
	
@ Write YOUR CODE HERE	

@ ---------------------	
fact:
	MOV r1,#1       @declare a temp to hold value of factorial and initialize to 1
	MOV r2,#1       @i=1
	LOOP:
		CMP r2,r0   @Compare the valueof i and the argument(n) value
		BHI Exit	@Exit if r2>r0
		MUL r3,r1,r2@r3=r1*r2(temp=fact*i)
		MOV r1,r3   @Move value of r3 to r1 
		ADD r2,r2,#1@increment the value of i
		B LOOP		@go to loop
	Exit:
		MOV r0,r1	@move the final value of r1(factorial) to r0
		MOV pc,lr	@return to caller
		

@ ---------------------	

.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value n

	@ calling the fact function
	mov r0, r4 	@the arg1 load
	bl fact
	mov r5,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "Factorial of %d is %d\n"

