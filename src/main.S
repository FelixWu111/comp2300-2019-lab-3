.syntax unified
.global main

main:
@ set the negative flag
movs r0, 5
movs r3, 6
subs r2, r0, r3

@ set the zero flag
movs r0, 5
movs r3, 5
subs r2, r0, r3

@ set the carry flag
movs r0, 0xFF000000
movs r3, 0xFF000000
adds r2, r2, r3

@ set the overflow flag
movs r0, 0x7FFFFFFF 
adds r0, 1
movs r0, 0x80000000
subs r0, 1

@ your code goes here
movs r1, #100

@ a simple infinite loop
healthloop:
  adds r1, #50
  b healthloop 

end_loop:
  nop
  b end_loop
  