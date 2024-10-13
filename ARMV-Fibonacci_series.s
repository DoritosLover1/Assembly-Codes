@Fibonacci Code at ARMV7

.section .data
fib1: .word 0
fib2: .word 1
fibonacci_series: .space 40 

.section .text
.global _start

_start:
	ldr r0,=fib1
	ldr r1,=fib2
	ldr r2,=fibonacci_series
	mov r3,#10

loop:
	ldr r4,[r0]
	ldr r5,[r1]
	str r4,[r2],#4
	add r6,r4,r5
	str r5,[r0]
	str r6,[r1]
	subs r3,r3,#1
	bne loop
end:
	mov r7,#1
	svc #0
	