/*** main.S *******************************************************************\
 * Contributors: HackerDaGreat57                                              *
 * Copyright: Public Domain                                                   *
 * Description: Says "Hello World" repeatedly with a counter at the end       *
 *   r0: first parameter to printf                                            *
 *   r1: second parameter to printf                                           *
 *   r7: index counter                                                        *
\******************************************************************************/

.thumb_func @ Necessary because SDK uses BLX
.global main @ Provide program starting address to linker

main:
  bl stdio_init_all @ Initialize UART/USB
  mov r7, #0 @ Initialize counter to 0
loop:
  ldr r0, =s_helloworld @ Load address of string
  add r7, #1 @ Increment counter
  mov r1, r7 @ Move the counter to the second parameter
  bl printf @ Call pico_printf
  b loop @ Loop forever

.data
.align 4 @ Necessary alignment
s_helloworld: .asciz "Hello World %d\n"