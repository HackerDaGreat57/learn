/*** main.S *******************************************************************\
 * Contributors: HackerDaGreat57                                              *
 * Copyright: Public Domain                                                   *
 * Description: Calculates 8-bit two's complements for -79 and -23.           *
 *    - r0: first argument for printf                                         *
 *    - r1: second argument for printf                                        *
 *    - r6: holds numbers (-79 or -23 depending on where in the program you   *
 *          try to access it from)                                            *
 *    - r7: bit manipulation happens here                                     *
\******************************************************************************/

.thumb_func @ necessary because SDK uses BLX
.global main @ provide program starting address to linker

main:
  bl stdio_init_all @ initialize UART/USB
  ldr r0, =__init_screen @ this basically resets the terminal (clear screen, move cursor to (0,0))
  bl printf @ ^ go!

  mov r6, #79 @ load 79 into r6
  neg r6, r6 @ it needs to be -79 actually!

  mov r7, r6 @ move -79 into r7 so we can do the tc calculation
  mvn r7, r7 @ calculating two's complement part 1: flipping all the bits
  add r7, r7, #1 @ ^ part 2: add 1
  @ r7 now contains 32-bit two's complement of -79 (79). But it can be interpreted as 8-bit since everything
  @ to the left of the 8th bit is essentially worthless.

  ldr r0, =p_header @ printing the calculation list for two's complement of -79
  mov r1, r6 @ the header contains the original decimal number at the end.
  bl printf @ print the header for tc of -79
  ldr r0, =p_tcDec @ printing decimal calculation of tc(-79)
  mov r1, r7 @ result of tc(-79) is in r7, move it to r1 for printing
  bl printf @ print decimal result of tc(-79)
  ldr r0, =p_tcHex
  mov r1, r7
  bl printf @ print hexadecimal result of tc(-79)
  ldr r0, =p_tcBin
  mov r1, r7
  bl printf @ print binary result of tc(-79)

  ldr r0, =p_break @ load \n into r0
  bl printf @ add an extra line break for formatting purposes

  @ now for tc(-23):
  mov r6, #23 @ load 23 into r6
  neg r6, r6 @ again, negate it because we want -23.

  mov r7, r6 @ move -23 into r7 so we can do the tc calculation
  mvn r7, r7 @ tc step 1: flip all bits
  add r7, r7, #1 @ tc step 2: add 1
  @ r7 now contains tc of -23, fits within just 6 bits!

  ldr r0, =p_header @ printing the calculation list for two's complement of -23
  mov r1, r6 @ the header contains the original decimal number at the end.
  bl printf @ print the header for tc of -23
  ldr r0, =p_tcDec @ printing decimal calculation of tc(-23)
  mov r1, r7 @ result of tc(-23) is in r7, move it to r1 for printing
  bl printf @ print decimal result of tc(-23)
  ldr r0, =p_tcHex
  mov r1, r7
  bl printf @ print hexadecimal result of tc(-23)
  ldr r0, =p_tcBin
  mov r1, r7
  bl printf @ print binary result of tc(-23)

__done:
  b __done @ loop infinitely when the program is done executing

.data
.align 4 @ necessary alignment
__init_screen: .asciz "\033[2J\033[H" @ clear screen, move cursor to (0,0)

p_header: .asciz "Two's Complement of %d:\n" @ printed at the top of every two's complement calculation list
p_tcDec: .asciz "  - Dec: %d\n" @ prints two's complement in decimal
p_tcHex: .asciz "  - Hex: %#x\n" @ ^ hexadecimal
p_tcBin: .asciz "  - Bin: %#b\n" @ ^ binary
p_break: .asciz "\n" @ just a line break