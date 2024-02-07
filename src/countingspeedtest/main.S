/*** main.S *******************************************************************\
 * Contributors: HackerDaGreat57                                              *
 * Copyright: Public Domain                                                   *
 * Description: Counts (increments register) and prints result as fast as     *
 *   possible                                                                 *
 *    - r0: first parameter to printf                                         *
 *    - r1: second parameter to printf                                        *
 *    - r7: index counter                                                     *
 *                                                                            *
 * Note that it doesn't *actually* run as fast as possible because it's       *
 * limited to the default clockspeed and a pathetic baud rate of 115200 on    *
 * UART. There shall be a sequel!                                             *
\******************************************************************************/

.thumb_func @ Necessary because SDK uses BLX
.global main @ Provide program starting address to linker

main:
  bl stdio_init_all @ Initialize UART/USB
  mov r7, #0 @ Initialize counter to 0
loop:
  ldr r0, =print_num @ Load address of string
  add r7, #1 @ Increment counter
  mov r1, r7 @ Move the counter to the second parameter
  bl printf @ Call pico_printf
  b loop @ Loop forever

.data
.align 4 @ Necessary alignment
print_num: .asciz "%d\n"