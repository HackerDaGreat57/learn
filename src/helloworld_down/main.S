/*** main.S *******************************************************************\
 * Contributors: HackerDaGreat57                                              *
 * Copyright: Public Domain                                                   *
 * Description: The `helloworld` code but counting down instead of up.        *
 *    - r0: First argument to printf                                          *
 *    - r1: Second argument to printf                                         *
 *    - r7: Counter                                                           *
\******************************************************************************/

.thumb_func @ Necessary because SDK uses BLX
.global main @ Provide program starting address to linker
@very gay
main:
  BL stdio_init_all @ Initialize UART/USB
  ldr r0, =_init_screen
  bl printf @ Basically reset the terminal (clear screen, move cursor to (0,0))

  mov r7, #0 @ Initialize counter to 0
loop:
  ldr r0, =s_helloworld @ Load address of string
  sub r7, #1 @ Decrement counter
  mov r1, r7 @ Move the counter to the second parameter
  bl printf @ Call pico_printf
  b loop @ Loop forever

.data
.align 4 @ Necessary alignment
_init_screen: .asciz "\033[2J\033[H" @ Clear screen, move cursor to (0,0)

s_helloworld: .asciz "Hello World %d\n"