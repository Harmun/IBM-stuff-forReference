000100161115     FMARKSDSP2 CF   E             WORKSTN
000102161115     DPASSMARK         S              5S 0 INZ(50)
000103161115     DSUMGRADE         S              9S 0 INZ(0)
000104161115                                                                     /FREE
000105161115              EXSR STATISTICS;                //initialize RECORD3 variables
000106161115              EXSR CLEARMARKS;                //initialize RECORD1 variables
000107161115              EXFMT RECORD1;
000108161115                   DOW NOT(*IN03);
000109161115                     EXSR GETGRADE;
000110161115                     *IN99 = *ON;                  // protect input fields
000111161115                     WRITE RECORD1;
000112161115                     EXFMT RECORD2;
000113161115                     IF *IN03 = *OFF;
000114161115                       EXSR CLEARMARKS;
000115161115                       *IN40 = *OFF;               // turn off dropped message TEST1
000116161115                       *IN50 = *OFF;               // turn off dropped message TEST2
000117161115                       *IN60 = *OFF;               // turn off dropped message TEST3
000118161115                       *IN70 = *OFF;               // turn off failed message EXAM
000119161115                       *IN80 = *OFF;               // turn off failed message TEST
000120161115                       *IN99 = *OFF;               // turn off protect input fields
000121161115                       EXFMT RECORD1;
000122161115                     ENDIF;
000123161115                   ENDDO;
000124161115              TOTAL = PASS + FAIL;
000125161115              AVERAGE = SUMGRADE / TOTAL;
000126161115              EXFMT RECORD3;
000127161115              *INLR = *ON;
000128161115              RETURN;
000129161115
000130161115       BEGSR GETGRADE;
000131161115         SELECT;
000132161115           WHEN (TEST1 < TEST2) AND (TEST1 < TEST3);
000133161115             TESTOVRALL = (TEST2 + TEST3)/2;
000134161115             *IN40 = *ON;
000135161115           WHEN (TEST2 < TEST1) AND (TEST2 < TEST3);
000136161115             TESTOVRALL = (TEST1 + TEST3)/2;
000137161115             *IN50 = *ON;
000138161115           WHEN (TEST3 < TEST1) AND (TEST3 < TEST2);
000139161115             TESTOVRALL = (TEST1 + TEST2)/2;
000140161115             *IN60 = *ON;
000141161115           WHEN (TEST1 = TEST2) AND (TEST2 = TEST3);     //IF 3 TESTS ARE EQUAL
000142161115             TESTOVRALL = (TEST2 + TEST3)/2;
000143161115             *IN40 = *ON;
000144161115         ENDSL;
000145161115
000146161115         NUMGRADE = (TESTOVRALL * 0.35)+(EXAM * 0.35)+ (((LABS/30)*100)*0.30);
000147161115         SUMGRADE = SUMGRADE + NUMGRADE;
000148161115
000149161115         SELECT;
000150161115           WHEN EXAM < PASSMARK;
000151161115             *IN70 = *ON;
000152161115             LETGRADE = 'F';
000153161115           WHEN TESTOVRALL < PASSMARK;
000154161115             *IN80 = *ON;
000155161115             LETGRADE = 'F';
000156161115           WHEN NUMGRADE >= 90;
000157161115             LETGRADE = 'A+';
000158161115           WHEN NUMGRADE >= 80;
000159161115             LETGRADE = 'A';
000160161115           WHEN NUMGRADE >= 75;
000161161115             LETGRADE = 'B+';
000162161115           WHEN NUMGRADE >= 70;
000163161115             LETGRADE = 'B';
000164161115           WHEN NUMGRADE >= 65;
000165161115             LETGRADE = 'C+';
000166161115           WHEN NUMGRADE >= 60;
000167161115             LETGRADE = 'C';
000168161115           WHEN NUMGRADE >= 55;
000169161115             LETGRADE = 'D+';
000170161115           WHEN NUMGRADE >= 50;
000171161115             LETGRADE = 'D';
000172161115           WHEN NUMGRADE >= 0;
000173161115             LETGRADE = 'F';
000174161115         ENDSL;
000175161115
000176161115         IF LETGRADE = 'F';
000177161115           FAIL = FAIL + 1;
000178161115         ELSE;
000179161115           PASS = PASS + 1;
000180161115         ENDIF;
000181161115       ENDSR;
000182161115
000183161115       //CLEARMARKS SUBROUTINE
000184161115       BEGSR CLEARMARKS;
000185161115         TEST1 = 0;
000186161115         TEST2 = 0;
000187161115         TEST3 = 0;
000188161115         LABS = 0;
000189161115         EXAM = 0;
000190161115       ENDSR;
000191161115
000192161115       //STATISTICS SUBROUTINE
000193161115       BEGSR STATISTICS;
000194161115         PASS = 0;
000195161115         FAIL = 0;
000196161115         TOTAL = 0;
000197161115         AVERAGE = 0;
000198161115       ENDSR;
