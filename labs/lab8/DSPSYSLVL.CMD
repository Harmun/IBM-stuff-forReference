000100161104CMD 'DISPLAY SYSTEM LEVEL'
000101161107
000102161104PARM KWD(OUTPUT)                                      +
000103161107     MIN(1)                                           +
000104161104     TYPE(*CHAR) LEN(9)                               +
000105161104     RSTD(*YES)                                       +
000106161104     VALUES(*MSGLINE *DISPLAY *PRINTER)               +
000107161104     PROMPT('OUTPUT FOR SYSTEL LEVEL:')
000108161107
000109161104PARM KWD(SOLUTION)                                    +
000110161104     TPYE(*CHAR) LEN(4)                               +
000111161104     RSTD(*YES)                                       +
000112161104     VALUES(*YES *NO)                                 +
000113161104     DFT(*NO)                                         +
000114161104     PROMPT('TELL ME HOW YOU DID IT:')
000115161107
000116161107PARM KWD(SHOWCMD)                                     +
000117161107     TYPE(*CHAR)  LEN(4)                              +
000119161107     RSTD(*YES)                                       +
000120161107     VALUES(*YES *NO)                                 +
000121161107     DFT(*NO)                                         +
000122161107     PROMPT('SHOW THIS COMMAND:')
