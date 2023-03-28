@ ARM Assembly - lab 3.2 
@ Group Number :

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE
@algorithm to get a%b
@while(a>=b){
@   a=a-b 
@}

@ ---------------------	
gcd:
    SUB sp,sp,#8     @Adjust stack for 2 items
	STR r4,[sp,#4]   @save r4 to the stack
    STR lr,[sp,#0]   @save return address
    cmp r1,#0        @ compare b with 0
    BEQ Exit         @go to exit if b=0

loop: 
	cmp r0,r1        @compare a and b 
    BLT Else         @go to Else if a<b
    SUB r0,r0,r1     @a=a-b
    B loop           @go to loop
      
Else:  
	MOV r4,r0         @store r0(a%b) value in r4 register
    MOV r0,r1         @a=b
    MOV r1,r4         @b=a%b
    BL gcd            @nested call to function gcd (gcd(b,a%b))
    LDR lr,[sp,#0]    @restore return address
	LDR r4,[sp,#4]    @restore r4    
     
Exit: 
    ADD sp,sp,#8      @pop 2 item from stack
    MOV pc,lr         @return to caller
@ ---------------------	

	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #64 	@the value a
	mov r5, #24	@the value b
	

	@ calling the mypow function
	mov r0, r4 	@the arg1 load
	mov r1, r5 	@the arg2 load
	bl gcd
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
format: .asciz "gcd(%d,%d) = %d\n"

