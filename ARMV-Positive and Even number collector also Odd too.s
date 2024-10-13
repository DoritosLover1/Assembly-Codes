@Positive and even number collector at ARMV7

.section .data
numbers:
	.word 5,-2,8,-10,3,6,0
	.equ size,7
even_numbers:
	.space 28
odd_numbers:
	.space 28

.section .text
.global _start

_start:
	ldr r4,=numbers
	ldr r5,=even_numbers
	ldr r6,=odd_numbers
	
	mov r3,#0
	mov r2,#0
	mov r1,#0

loop:
	cmp r3,#size
	bge end_loop
	ldr r0,[r4,r3,LSL#2]
	
	tst r0,#1
	bne store_odd
	
	str r0,[r5,r1,LSL#2]
	add r1,r1,#1
	b next_number
	
store_odd:
	str r0,[r6,r2,LSL#2]
	add r2,r2,#1

next_number:
	add r3,r3,#1
	b loop

end_loop:
	mov r7,#1
	mov r0,#0
	swi 0


	
	
	