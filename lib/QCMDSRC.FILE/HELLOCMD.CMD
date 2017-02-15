000100161115  CMD 'HELLO UNIVERSE'
000101161115
000102161115  PARM   KWD(PLANET)                                   +
000103161115         MIN(1)                                        +
000104161115         TYPE(*CHAR) LEN(8)                            +
000105161115         PROMPT('DESTINATION PLANET:')
000106161115  PARM   KWD(MYNAME)                                   +
000107161115         MIN(1)                                        +
000108161115         TYPE(*CHAR)  LEN(31)                          +
000109161115         PROMPT('MY NAME:')
000110161115  PARM   KWD(OUTPUT)                                   +
000111161115         TYPE(*CHAR) LEN(9)                            +
000112161115         RSTD(*YES)                                    +
000113161115         VALUES(*MSGLINE *DISPLAY *PRINTER)            +
000114161115         DFT(*MSGLINE)                                 +
000115161115         PROMPT('OUTPUT FOR UNIVERSE MESSAGE:')
000116161115  PARM   KWD(SHOWNME)                                  +
000117161115         TYPE(*CHAR)  LEN(4)                           +
000118161115         RSTD(*YES)                                    +
000119161115         VALUES(*YES *NO)                              +
000120161115         DFT(*NO)                                      +
000121161115         PROMPT('SHOW NAME:')
