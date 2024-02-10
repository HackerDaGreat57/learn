/*** main.S *******************************************************************\
 * Contributors: HackerDaGreat57                                              *
 * Copyright: Public Domain                                                   *
 * Description: Template RP2040 ASM file.                                     *
 *    - r0: [register usage]                                                  *
 *    - r1: [register usage]                                                  *
 *    - r2: [register usage]                                                  *
 *    - r3: [register usage]                                                  *
\******************************************************************************/

.thumb_func @ necessary because SDK uses BLX
.global main @ provide program starting address to linker

main:
  bl stdio_init_all @ initialize UART/USB
  ldr r0, =__init_screen @ this basically resets the terminal (clear screen, move cursor to (0,0))
  bl printf @ ^ go!

__done:
  b __done @ loop infinitely when the program is done executing

.data
.align 4 @ necessary alignment
__init_screen: .asciz "\033[2J\033[H" @ clear screen, move cursor to (0,0)