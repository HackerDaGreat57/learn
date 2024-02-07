/*** main.S *******************************************************************\
 * Contributors: HackerDaGreat57                                              *
 * Copyright: Public Domain                                                   *
 * Description: Template RP2040 ASM file.                                     *
 *    - r0: [register usage]                                                  *
 *    - r1: [register usage]                                                  *
 *    - r2: [register usage]                                                  *
 *    - r3: [register usage]                                                  *
\******************************************************************************/

.thumb_func @ Necessary because SDK uses BLX
.global main @ Provide program starting address to linker

main:
  BL stdio_init_all @ Initialize UART/USB
  ldr r0, =init_screen
  bl printf @ Basically reset the terminal (clear screen, move cursor to (0,0))

.data
.align 4 @ Necessary alignment
_init_screen: .asciz "\033[2J\033[H" @ Clear screen, move cursor to (0,0)