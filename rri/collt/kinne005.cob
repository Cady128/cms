      * @package cms
      * @link    http://www.cmsvt.com
      * @author  s waite <cmswest@sover.net>
      * @copyright Copyright (c) 2020 cms <cmswest@sover.net>
      * @license https://github.com/openemr/openemr/blob/master/LICENSE GNU General Public License 3
       IDENTIFICATION DIVISION.
       PROGRAM-ID. NEI146.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FILEIN ASSIGN TO "S30" ORGANIZATION
           LINE SEQUENTIAL.
           SELECT GARFILE ASSIGN TO "S35"     ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS G-GARNO
           ALTERNATE RECORD KEY IS G-ACCT WITH DUPLICATES
           LOCK MODE MANUAL.
           SELECT CHARCUR ASSIGN TO "S40"     ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC  RECORD KEY IS CHARCUR-KEY
           ALTERNATE RECORD KEY IS CC-PAYCODE WITH DUPLICATES
           LOCK MODE MANUAL.
           SELECT ERROR-FILE ASSIGN TO "S45" ORGANIZATION
           LINE SEQUENTIAL.
           SELECT FILEOUT ASSIGN TO "S50" ORGANIZATION
           LINE SEQUENTIAL.
           SELECT PAYFILE ASSIGN TO "S55" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS PAYFILE-KEY
           LOCK MODE MANUAL.
           SELECT PAYCUR ASSIGN TO "S60" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS PAYCUR-KEY
           LOCK MODE MANUAL.

       DATA DIVISION.
       FILE SECTION.
       FD  FILEIN.
       01  FILEIN01.
           02 FI-GARNO PIC X(8).
           02 FILLER PIC X VALUE SPACES.
           02 FI-DEDUCT PIC 9(4)V99.
           02 FILLER PIC X VALUE SPACES.
           02 FI-PAID PIC 9(4)V99.
       FD  PAYCUR
           BLOCK CONTAINS 6 RECORDS
           DATA RECORD IS PAYCUR01.
       01  PAYCUR01.
           02 PAYCUR-KEY.
             03 PC-KEY8 PIC X(8).
             03 PC-KEY3 PIC XXX.
           02 PC-AMOUNT PIC S9(4)V99.
           02 PC-PAYCODE PIC XXX.
           02 PC-DENIAL PIC XX.
           02 PC-CLAIM PIC X(6).
           02 PC-DATE-T PIC X(8).
           02 PC-DATE-E PIC X(8).
           02 PC-BATCH PIC X(6).
       FD  PAYFILE.
       01  PAYFILE01.
           02 PAYFILE-KEY.
             03 PD-KEY8 PIC X(8).
             03 PD-KEY3 PIC XXX.
           02 PD-NAME PIC X(24).
           02 PD-AMOUNT PIC S9(4)V99.
           02 PD-PAYCODE PIC XXX.
           02 PD-DENIAL PIC XX.
           02 PD-CLAIM PIC X(6).
           02 PD-DATE-T PIC X(8).
           02 PD-DATE-E PIC X(8).
           02 PD-ORDER PIC X(6).
           02 PD-BATCH PIC X(6).
       FD ERROR-FILE.
       01 ERROR-FILE01 PIC X(132).
       FD FILEOUT.
       01 FILEOUT01 PIC X(133).
       FD  CHARCUR
           BLOCK CONTAINS 5 RECORDS
           DATA RECORD IS CHARCUR01.
       01  CHARCUR01.
           02 CHARCUR-KEY.
             03 CC-KEY8 PIC X(8).
             03 CC-KEY3 PIC XXX.
           02 CC-PATID PIC X(8).
           02 CC-CLAIM PIC X(6).
           02 CC-SERVICE PIC X.
           02 CC-DIAG PIC X(7).
           02 CC-PROC. 
              03 CC-PROC0 PIC X(4).
              03 CC-PROC1 PIC X(5).
              03 CC-PROC2 PIC XX.
           02 CC-MOD2 PIC XX.
           02 CC-MOD3 PIC XX.
           02 CC-MOD4 PIC XX.
           02 CC-AMOUNT PIC S9(4)V99.
           02 CC-DOCR PIC X(3).
           02 CC-DOCP PIC X(2).
           02 CC-PAYCODE PIC XXX.
           02 CC-STUD PIC X.
           02 CC-WORK PIC XX.
           02 CC-DAT1 PIC X(8).
           02 CC-RESULT PIC X.
           02 CC-ACT PIC X.
           02 CC-SORCREF PIC X.
           02 CC-COLLT PIC X.
           02 CC-AGE PIC X.
           02 CC-PAPER PIC X.
           02 CC-PLACE PIC X.
           02 CC-EPSDT PIC X.
           02 CC-DATE-T PIC X(8).
           02 CC-DATE-A PIC X(8).
           02 CC-DATE-P PIC X(8).
           02 CC-REC-STAT PIC X.
           02 CC-DX2 PIC X(7).
           02 CC-DX3 PIC X(7).
           02 CC-ACC-TYPE PIC X.
           02 CC-DATE-M PIC X(8).
           02 CC-ASSIGN PIC X.
           02 CC-NEIC-ASSIGN PIC X.
           02 CC-DX4 PIC X(7).
           02 CC-DX5 PIC X(7).
           02 CC-DX6 PIC X(7).
           02 CC-FUTURE PIC X(6).
       FD GARFILE
           BLOCK CONTAINS 3 RECORDS
           DATA RECORD IS G-MASTER.
       01 G-MASTER.
           02 G-GARNO.
             03 ID1 PIC XXX.
             03 ID2 PIC XXX.
             03 ID3 PIC XX.
           02 G-GARNAME PIC X(24).
           02 G-BILLADD PIC X(22).
           02 G-STREET PIC X(22).
           02 G-CITY PIC X(18).
           02 G-STATE PIC X(2).
           02 G-ZIP PIC X(9).
           02 G-COLLT PIC X.
           02 G-PHONE PIC X(10).
           02 G-SEX PIC X.
           02 G-RELATE PIC X.
           02 G-MSTAT PIC X.
           02 G-DOB PIC X(8).
           02 G-DUNNING PIC X.
           02 G-ACCTSTAT PIC X.
           02 G-PR-MPLR PIC X(4).
           02 G-PRINS PIC XXX.
           02 G-PR-ASSIGN PIC X.
           02 G-TRINSIND PIC X.
           02 G-TRINS PIC XXX.
           02 G-PR-GROUP PIC X(12).
           02 G-PRIPOL0.
             03 G-PRIPOL PIC X(9).
             03 G-PR-SUFX PIC XXX.
             03 G-PR-FILLER PIC XX.
           02 G-PRNAME PIC X(24).
           02 G-PR-RELATE PIC X.
           02 G-SE-MPLR PIC X(4).
           02 G-SEINS PIC XXX.
           02 G-SE-ASSIGN PIC X.
           02 G-SE-OFFICE PIC X(4).
           02 G-SE-GROUP PIC X(12).
           02 G-SECPOL0. 
              03 G-SECPOL PIC X(9).
              03 G-SE-FILLER PIC X(5).
           02 G-SENAME PIC X(24).
           02 G-SE-RELATE PIC X.
           02 G-INSPEND PIC S9(5)V99.
           02 G-LASTBILL PIC X(8).
           02 G-ASSIGNM PIC X.
           02 G-PRIVATE PIC X.
           02 G-BILLCYCLE PIC X.
           02 G-DELETE PIC X.
           02 G-FILLER PIC XXX.
           02 G-ACCT PIC X(8).
           02 G-PRGRPNAME PIC X(15).
           02 G-SEGRPNAME PIC X(15).


       WORKING-STORAGE SECTION.

       
       01  TOT-AMT PIC S9(4)V99.
       01  CLAIM-TOT PIC S9(5)V99.
       01  FLAG PIC 9 VALUE 0.
       01  TOT-PAY PIC S9(5)V99 VALUE 0.
       01  X PIC 99.
       01  Y PIC 99.
       01  Z PIC 99.
       01  A PIC 99.
       01 HOLDKEY PIC X(11).
       01  TEST-DATE.
           05  T-CC            PIC 99.
           05  T-YY            PIC 99.
           05  T-MM            PIC 99.
           05  T-DD            PIC 99.
       01  INPUT-DATE.
           02 T-MM PIC XX.
           02 T-DD PIC XX.
           02 T-CC PIC XX.
           02 T-YY PIC XX.
       01  ALF6.
           02 ALF4 PIC X(4).
           02 ALF2 PIC XX.
       01  PAYDATE PIC X(8).
       01  XYZ PIC 999.
       01  NUM6 PIC 9(6).
       01  PAYBACK01 PIC X(80).
       01  ALF1 PIC X.
       01  NEF-6 PIC Z,ZZ9.99CR.
       PROCEDURE DIVISION.
       0005-START.
           OPEN INPUT FILEIN CHARCUR GARFILE PAYCUR.
           OPEN OUTPUT ERROR-FILE FILEOUT.
           OPEN I-O PAYFILE.
        P2-1.
           DISPLAY "DATE  YYYYMMDD FORMAT"
           ACCEPT PD-DATE-T
           IF PD-DATE-T NOT NUMERIC
             DISPLAY "BAD DATE"
             GO TO P2-1
           END-IF.

       P1.
           READ FILEIN AT END GO TO P9.
           MOVE FI-GARNO TO G-GARNO
           READ GARFILE INVALID GO TO E1.
           MOVE G-GARNO TO CC-KEY8
           MOVE SPACE TO CC-KEY3
           START CHARCUR KEY NOT < CHARCUR-KEY INVALID GO TO E1.
       P2. 
           READ CHARCUR NEXT AT END GO TO E1.
           IF CC-KEY8 NOT = G-GARNO GO TO E1.
           IF CC-COLLT NOT = "1" GO TO P2.
           MOVE FI-PAID TO NEF-6
           DISPLAY NEF-6 " PAID"
           MOVE FI-DEDUCT TO NEF-6
           DISPLAY NEF-6 " DEDUCT"
           MOVE 0 TO FLAG
           PERFORM A1 THRU A3
           IF FLAG = 1 GO TO P2.
           MOVE SPACE TO PD-DENIAL 
           MOVE "018" TO PD-PAYCODE
           ACCEPT PD-ORDER FROM TIME .
           MOVE PD-DATE-T TO PD-DATE-E
           MOVE SPACE TO PD-BATCH
           MOVE CC-CLAIM TO PD-CLAIM
           MOVE G-GARNO TO PD-KEY8
           MOVE SPACE TO PD-KEY3
           MOVE G-GARNAME TO PD-NAME
           MOVE 0 TO PD-AMOUNT
            MOVE PAYFILE01 TO PAYBACK01
            PERFORM S4 THRU S5 
            MOVE 0 TO XYZ
           IF FI-PAID NOT = 0
            IF CLAIM-TOT NOT < FI-PAID 
             COMPUTE PD-AMOUNT =  -1 * FI-PAID
            ELSE
             COMPUTE PD-AMOUNT = -1 * CLAIM-TOT
            END-IF
            COMPUTE FI-PAID = FI-PAID + PD-AMOUNT
            WRITE FILEOUT01 FROM CHARCUR01
            MOVE PAYFILE01 TO PAYBACK01
            PERFORM P3 THRU P4
           END-IF
            ADD PD-AMOUNT TO CLAIM-TOT
           IF CLAIM-TOT = 0 GO TO P2.
           IF CLAIM-TOT NOT < FI-DEDUCT 
           COMPUTE PD-AMOUNT =  -1 * FI-DEDUCT
           ELSE
           COMPUTE PD-AMOUNT = -1 * CLAIM-TOT
           END-IF
           COMPUTE FI-DEDUCT = FI-DEDUCT + PD-AMOUNT
           MOVE "14" TO PD-DENIAL
           MOVE PAYFILE01 TO PAYBACK01
           PERFORM P3 THRU P4
           IF FI-DEDUCT = 0 GO TO P1.
           GO TO P2.
       P3.
           ADD 1 TO XYZ
           MOVE XYZ TO PD-KEY3
           READ PAYFILE INVALID KEY GO TO P4.
           GO TO P3.
       P4.
           MOVE PAYBACK01 TO PAYFILE01
           MOVE XYZ TO PD-KEY3
           IF PD-AMOUNT NOT = 0
           WRITE PAYFILE01
           DISPLAY PAYFILE-KEY " " PD-NAME
           DISPLAY "RECORD IS ADDED"
           END-IF.

       S4.
           MOVE CC-AMOUNT TO CLAIM-TOT
           MOVE CC-KEY8 TO PC-KEY8
           MOVE "000" TO PC-KEY3.
           START PAYCUR KEY NOT <  PAYCUR-KEY INVALID GO TO S5.
       S41.
           READ PAYCUR NEXT AT END GO TO S5.
           IF PC-KEY8 NOT = CC-KEY8 GO TO S5.
           IF PC-CLAIM NOT = CC-CLAIM GO TO S41. 
           ADD PC-AMOUNT TO CLAIM-TOT.
           GO TO S41.
       S5. EXIT.
       A1.
           MOVE CC-KEY8 TO PD-KEY8
           MOVE "000" TO PD-KEY3.
           START PAYFILE KEY NOT <  PAYFILE-KEY INVALID GO TO A3.
       A2. READ PAYFILE NEXT AT END GO TO A3.
           IF PD-KEY8 NOT = CC-KEY8 GO TO A3.
           IF PD-CLAIM NOT = CC-CLAIM GO TO A2.
           MOVE 1 TO FLAG.
       A3.
           EXIT.
       E1.
           IF NOT (FI-PAID = 0 AND FI-DEDUCT = 0)
           WRITE ERROR-FILE01 FROM FILEIN01.
           GO TO P1.
       P9.
           CLOSE CHARCUR GARFILE ERROR-FILE FILEOUT PAYFILE PAYCUR
           STOP RUN.
