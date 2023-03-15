@ ARM Assembly - lab 2
@ Group Number :26

	.text 	@ instruction memory
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	@ load values
	MOV r0,#0       @load value 0 to i
	MOV r5,#0		@load value 0 to sum
	
	@ Write YOUR CODE HERE
	
	@	Sum = 0;
	@	for (i=0;i<10;i++){
	@			for(j=5;j<15;j++){
	@				if(i+j<10) sum+=i*2
	@				else sum+=(i&j);	
	@			}	
	@	} 
	@ Put final sum to r5


	@ ---------------------
Loop1:	CMP r0,#10                    @Compare value of i with 10
	BGE Loop1Exit                 @if(i>=10)
	MOV r1,#5                     @Load value 5 to j
	Loop2: 	CMP r1,#15            @Compare value of j with 15
		BGE Loop2Exit         @if(j>=15)
		ADD r2,r0,r1          @register r2 gets (i in r0 + j in r1)
		CMP r2,#10            @Compare value in r2 with 10
		ADDLT r5,r5,r0,LSL #1 @Left shift one bit of value i and sum+=i*2
		AND r3,r0,r1          @Perform Bitwise AND on i and j(i&j)
		ADDGE r5,r5,r3	      @sum+=(i&j)
		ADD r1,r1,#1          @incementing j value by 1
		B Loop2		          @go to Loop2
	Loop2Exit:
		ADD r0,r0,#1          @incrementing value i by 1
		B Loop1               @go to Loop1
				
Loop1Exit:
	
	@ ---------------------
	
	
	@ load aguments and print
	ldr r0, =format
	mov r1, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "The Answer is %d (Expect 300 if correct)\n"

