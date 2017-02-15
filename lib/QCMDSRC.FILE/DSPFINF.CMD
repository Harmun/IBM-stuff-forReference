000100161117CMD 'DISPLAY FILE INFO'
000101161117
000102161117PARM KWD(FILE)                                        +
000103161117     MIN(1)                                           +
000104161117     TYPE(*CHAR) LEN(10)                              +
000105161117     PROMPT('FILE NAME FOR INFORMATION:')
000106161117
000107161117PARM KWD(LIBRARY)                                     +
000108161117     MIN(1)                                           +
000109161117     TYPE(*CHAR) LEN(10)                              +
000110161117     PROMPT('LIBARARY CONTAINING FILE:')
000111161117
000112161117PARM KWD(INFO)                                        +
000113161117     TYPE(*CHAR) LEN(10)                              +
000114161117     PROMPT('FILE INFORMATION TO VIEW:')              +
000115161117     VALUES(*DATA *FIELDS *FILE *RELATIONS *NONE)     +
000116161117     RSTD(*YES)                                       +
000117161117     DFT(*DATA)
000118161117
000119161117PARM KWD(SECURITY)                                    +
000120161117     TYPE(*CHAR) LEN(4)                               +
000121161117     PROMPT('VIEW FILE SECURITY:')                    +
000122161117     VALUES(*YES *NO)                                 +
000123161117     RSTD(*YES)                                       +
000124161117     DFT(*NO)
