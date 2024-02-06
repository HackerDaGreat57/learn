/*** main.S *******************************************************************\
 * Contributors: HackerDaGreat57                                              *
 * Copyright: Public Domain                                                   *
 * Description: Template RP2040 ASM file.                                     *
\******************************************************************************/

.thumb_func @ Necessary because SDK uses BLX
.global main @ Provide program starting address to linker

main:
  BL stdio_init_all @ Initialize UART/USB

.data
.align 4 @ Necessary alignment