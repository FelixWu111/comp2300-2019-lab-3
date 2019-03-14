.syntax unified
.global main

main:
@ @ set the negative flag
@ movs r0, 5
@ movs r3, 6
@ subs r2, r0, r3

@ @ set the zero flag
@ movs r0, 5
@ movs r3, 5
@ subs r2, r0, r3

@ @ set the carry flag
@ movs r0, 0xFF000000
@ movs r3, 0xFF000000
@ adds r2, r2, r3

@ @ set the overflow flag
@ movs r0, 0x7FFFFFFF 
@ adds r0, 1
@ movs r0, 0x80000000
@ subs r0, 1

@ your code goes here
movs r1, #100 //hp
movs r2, #100 //mp
movs r3, #100 //stamina

@ a simple infinite loop
healthloop:
  adds r1, #50
  b healthloop

@Skills!
fireball:@remove 20HP
  subs r1, #20

frenzy: @remove 20HP, but add 40 stamina
  subs r1, #20
  adds r3, #40
  
magic_poison: @do double the character’s mana attributes in damage (hp := hp - 2 * mana)
  lsl r4, r2, #1
  subs r1, r4


strength_from_weariness:@(hp := hp + (mana - stamina)^2)
  subs r4, r2, r4
  lsl r4, r4, #1
  adds r1, r4 

eye_of_Zardok: @(stamina := (hp * stamina) / 100; mana := (mana / 16)^3)
  mul r4, r1, r3
  movs r6, #100
  udiv r4, r4, r6
  movs r3, r4
  movs r7, #16
  udiv r4, r2, r7
  mul r5, r4, r4
  mul r5, r5, r4
  movs r2, r5

disintegrate:
  movs r1, #0
  movs r2, #0
  movs r3, #0  


end_loop:
  nop
  b end_loop
  