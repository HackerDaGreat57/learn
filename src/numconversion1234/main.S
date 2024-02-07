/*** main.S *******************************************************************\
 * Contributors: HackerDaGreat57                                              *
 * Copyright: Public Domain                                                   *
 * Description: Prints number 1234 in dec,bin,hex                             *
 *    - r0: first parameter to printf                                         *
 *    - r1: second parameter to printf                                        *
 *    - r7: number 1234                                                       *
\******************************************************************************/

.thumb_func @ Necessary because SDK uses BLX
.global main @ Provide program starting address to linker

main:
  bl stdio_init_all @ Initialize UART/USB
  ldr r0, =init_screen
  bl printf @ Basically reset the terminal (clear screen, move cursor to (0,0))

  mov r7, #255 @ Initialize number to (2^8)-1 (8 bits in immediate value for MOV instruction)
  add r7, #255 @ Gradually increment the number up to 1234 (as fast as ADD instruction format allows)
  add r7, #255 @   +^
  add r7, #255 @   +^
  add r7, #214 @ Now R7 = 1234[dec]

  ldr r0, =print_dec @ Getting ready to print decimal format
  mov r1, r7 @ Move the number to the second parameter
  bl printf @ Print decimal format

  ldr r0, =print_hex @ Getting ready to print hexadecimal format
  mov r1, r7 @ Move the number to the second parameter
  bl printf @ Print decimal format

  ldr r0, =print_bin @ Getting ready to print binary format
  mov r1, r7 @ Move the number to the second parameter
  bl printf @ Print decimal format
done:
  b done @ loop indefinitely when done

.data
.align 4 @ Necessary alignment
init_screen: .asciz "\033[2J\033[H" @ Clear screen, move cursor to (0,0)
print_dec: .asciz "Dec: %d\n"
print_hex: .asciz "Hex: %#x\n"
print_bin: .asciz "Bin: %#b\n" @ `%#b` seems to be specific to the Pico SDK implementation.