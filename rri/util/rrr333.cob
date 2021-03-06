      * @package cms
      * @link    http://www.cmsvt.com
      * @author  s waite <cmswest@sover.net>
      * @copyright Copyright (c) 2020 cms <cmswest@sover.net>
      * @license https://github.com/openemr/openemr/blob/master/LICENSE GNU General Public License 3
       IDENTIFICATION DIVISION.
       PROGRAM-ID. rrr333.
       AUTHOR. SID WAITE.
       DATE-COMPILED. TODAY.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PAYFILE ASSIGN TO "S30" ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC RECORD KEY IS PAYFILE-KEY.
           SELECT PAYCUR ASSIGN TO "S35" ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC RECORD KEY IS PAYCUR-KEY.
           SELECT GARFILE ASSIGN TO "S40" ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC RECORD KEY IS G-GARNO
           ALTERNATE RECORD KEY IS G-ACCT WITH DUPLICATES.
           SELECT PATFILE ASSIGN TO "S45" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS P-PATNO
           ALTERNATE RECORD KEY IS P-GARNO WITH DUPLICATES.
           SELECT CHARCUR ASSIGN TO "S50" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS CHARCUR-KEY
           ALTERNATE RECORD KEY IS CC-PAYCODE WITH DUPLICATES.
           SELECT CHARFILE ASSIGN TO "S55" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS CHARFILE-KEY.
           SELECT KEEPBACK ASSIGN TO "S60"
           ORGANIZATION LINE SEQUENTIAL.
           SELECT CMNTFILE ASSIGN TO "S65" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS CMNT-KEY.
           SELECT HISFILE ASSIGN TO "S70" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS HISFILE-KEY.
           SELECT AUTHFILE ASSIGN TO "S75" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS AUTH-KEY.
           SELECT MPLRFILE ASSIGN TO "S80" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS MPLR-KEY.

       DATA DIVISION.
       FILE SECTION.
       FD  KEEPBACK.
       01  KEEPBACK01.
           02 KEEPTYPE PIC XX.
           02 KEEPBACK02 PIC X(320).
       FD  GARFILE
      *    BLOCK CONTAINS 3 RECORDS
           DATA RECORD IS GARFILE01.
       01  GARFILE01.
           02 G-GARNO PIC X(8).
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
           02 G-PR-OFFICE PIC X(4).
           02 G-PR-GROUP PIC X(12).
           02 G-PRIPOL PIC X(14).
           02 G-PRNAME PIC X(24).
           02 G-PR-RELATE PIC X.
           02 G-SE-MPLR PIC X(4).
           02 G-SEINS PIC XXX.
           02 G-SE-ASSIGN PIC X.
           02 G-TRINSIND PIC X.
           02 G-TRINS PIC XXX.
           02 G-SE-GROUP PIC X(12).
           02 G-SECPOL PIC X(14).
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

       FD  CHARCUR
      *    BLOCK CONTAINS 3 RECORDS
           DATA RECORD IS CHARCUR01.
       01  CHARCUR01.
           02 CHARCUR-KEY.
             03 CC-KEY8 PIC X(8).
             03 CC-KEY3 PIC XXX.
           02 CC-PATID.
              03 CC-PATID7 PIC X(7).
              03 CC-PATID1 PIC X.
           02 CC-CLAIM PIC X(6).
           02 CC-SERVICE PIC X.
           02 CC-DIAG PIC X(7).
           02 CC-PROC PIC X(11).
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
           02 CC-AUTH PIC X.
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
       FD  CHARFILE
      *    BLOCK CONTAINS 2 RECORDS
           DATA RECORD IS CHARFILE01.
       01  CHARFILE01.
           02 CHARFILE-KEY.
             03 CD-KEY8 PIC X(8).
             03 CD-KEY3 PIC XXX.
           02 CD-PATID.
              03 CD-PATID7 PIC X(7).
              03 CD-PATID1 PIC X.
           02 CD-CLAIM PIC X(6).
           02 CD-SERVICE PIC X.
           02 CD-DIAG PIC X(7).
           02 CD-PROC PIC X(11).
           02 CD-MOD2 PIC XX.
           02 CD-MOD3 PIC XX.
           02 CD-MOD4 PIC XX.
           02 CD-AMOUNT PIC S9(4)V99.
           02 CD-DOCR PIC X(3).
           02 CD-DOCP PIC X(2).
           02 CD-PAYCODE PIC XXX.
           02 CD-STAT PIC X.
           02 CD-WORK PIC XX.
           02 CD-DAT1 PIC X(8).
           02 CD-RESULT PIC X.
           02 CD-ACT PIC X.
           02 CD-SORCREF PIC X.
           02 CD-COLLT PIC X.
           02 CD-AUTH PIC X.
           02 CD-PAPER PIC X.
           02 CD-PLACE PIC X.
           02 CD-NAME PIC X(24).
           02 CD-ESPDT PIC X.
           02 CD-DATE-T PIC X(8).
           02 CD-DATE-E PIC X(8).
           02 CD-ORDER PIC X(6).
           02 CD-DX2 PIC X(7).
           02 CD-DX3 PIC X(7).
           02 CD-DATE-A PIC X(8).
           02 CD-ACC-TYPE PIC X.
           02 CD-DATE-M PIC X(8).
           02 CD-ASSIGN PIC X.
           02 CD-NEIC-ASSIGN PIC X.
           02 CD-DX4 PIC X(7).
           02 CD-DX5 PIC X(7).
           02 CD-DX6 PIC X(7).
           02 CD-FUTURE PIC X(6).

       FD  PAYFILE
      *    BLOCK CONTAINS 4 RECORDS
           DATA RECORD IS PAYFILE01.
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


       FD  PAYCUR
      *    BLOCK CONTAINS 3 RECORDS
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

       FD PATFILE
      *    BLOCK CONTAINS 5 RECORDS
           DATA RECORD IS PATFILE01.
       01 PATFILE01.
           02 P-PATNO PIC X(8).
           02 P-GARNO PIC X(8).
           02 P-PATNAME PIC X(24).
           02 P-SEX PIC X.
           02 P-RELATE PIC X.
           02 P-MSTAT PIC X.
           02 P-DOB PIC X(8).

       FD  MPLRFILE.
       01  MPLRFILE01.
           02 MPLR-KEY PIC X(8). 
           02 MPLR-NAME PIC X(22).
           02 MPLR-STREET PIC X(24).
           02 MPLR-CITY PIC X(15).
           02 MPLR-STATE PIC XX.
           02 MPLR-ZIP PIC X(9).
           02 MPLR-CLAIMNO PIC X(15).
           02 MPLR-TRINS PIC XXX.
           02 MPLR-TR-ASSIGN PIC X.
           02 MPLR-TR-GROUP PIC X(12).
           02 MPLR-TRIPOL PIC X(14).
           02 MPLR-TR-NAME PIC X(24).
           02 MPLR-TR-RELATE PIC X.
           02 MPLR-FUTURE PIC X(6).

       FD  AUTHFILE
           BLOCK CONTAINS 6 RECORDS
           DATA RECORD IS AUTHFILE01.
       01  AUTHFILE01.
           02 AUTH-KEY.
              03 AUTH-KEY8 PIC X(8).
              03 AUTH-KEY6 PIC X(6).
           02 AUTH-NUM PIC X(15).
           02 AUTH-QNTY PIC XX.
           02 AUTH-DATE-E PIC X(8).
           02 AUTH-FILLER PIC XXX.
       FD  CMNTFILE
      *    BLOCK CONTAINS 2 RECORDS
           DATA RECORD IS CMNTFILE01.
       01  CMNTFILE01.
           02 CMNT-KEY.
             03 CM-KEY8 PIC X(8).
             03 CM-KEY3 PIC XXX.
           02 CMNT PIC X(80).
           02 CMNT-DATE-E PIC X(8).

       FD  HISFILE
           BLOCK CONTAINS 5 RECORDS
           DATA RECORD IS HISFILE01.
       01  HISFILE01.
           02 HISFILE-KEY.
             03 HS-KEY8 PIC X(8).
             03 HS-CLAIM PIC X(6).
             03 HS-REC-TYPE PIC X.
             03 HS-KEY4 PIC XXXX.
           02 HS-PATID. 
              03 HS-PATID7 PIC X(7).
              03 HS-PATID1 PIC X.
           02 HS-SERVICE PIC X.
           02 HS-DIAG PIC X(5).
           02 HS-PROC PIC X(11).
           02 HS-MOD2 PIC XX.
           02 HS-MOD3 PIC XX.
           02 HS-MOD4 PIC XX.
           02 HS-AMOUNT PIC X(6).
           02 HS-DOCR PIC X(3).
           02 HS-DOCP PIC X(2).
           02 HS-PAYCODE PIC XXX.
           02 HS-STUD PIC X.
           02 HS-WORK PIC XX.
           02 HS-DAT1 PIC X(8).
           02 HS-RESULT PIC X.
           02 HS-ACT PIC X.
           02 HS-SORCREF PIC X.
           02 HS-COLLT PIC X.
           02 HS-AGE PIC X.
           02 HS-PAPER PIC X.
           02 HS-PLACE PIC X.
           02 HS-EPSDT PIC X.
           02 HS-DATE-T PIC X(8).
           02 HS-DATE-A PIC X(8).
           02 HS-DATE-E PIC X(8).
           02 HS-REC-STAT PIC X.
           02 HS-DX2 PIC X(5).
           02 HS-DX3 PIC X(5).
           02 HS-ACC-TYPE PIC X.
           02 HS-DATE-M PIC X(8).
           02 HS-ASSIGN PIC X.
           02 HS-NEIC-ASSIGN PIC X.
           02 HS-FUTURE PIC X(6).
       WORKING-STORAGE SECTION.
       01  ANS          PIC XXX.
       01  NEW-NAME.
           02 NEW-3 PIC XXX.
           02 NEW-21 PIC X(21).
       01  GG.
           02 GG-1 PIC XXX.
           02 GG-5 PIC X(5).
       01  NN.
           02 NN-1 PIC X(3).
           02 NN-2 PIC X(5).
       01  OLDGARNO PIC X(8).
       01  SAVEGARNO PIC X(8).
       01  HOLDKEY11 PIC X(11).
       01  HOLDKEY19 PIC X(19).
       01  HOLDKEY14 PIC X(14).
       PROCEDURE DIVISION.
       P00.
           OPEN I-O PAYFILE.
           OPEN I-O CHARFILE.
           OPEN I-O CHARCUR.
           OPEN I-O PAYCUR.
           OPEN I-O PATFILE.
           OPEN I-O GARFILE.
           OPEN I-O CMNTFILE.
           OPEN I-O HISFILE.
           OPEN I-O MPLRFILE.
           OPEN I-O AUTHFILE.
           OPEN EXTEND KEEPBACK.
       P0.
           DISPLAY "ENTER THE NEW NAME".
           ACCEPT NEW-NAME.
           IF NEW-NAME = SPACE OR "END" OR "X" GO TO P9.
           DISPLAY NEW-NAME.
       P1.
           DISPLAY "OLD GARNO"
           ACCEPT OLDGARNO.
           IF OLDGARNO = "BK" GO TO P0.
           MOVE OLDGARNO TO G-GARNO
           READ GARFILE INVALID DISPLAY "BAD" GO TO P1.
           DISPLAY G-GARNO " " G-GARNAME " " G-PRINS "/" G-SEINS
           " " G-DOB.
           DISPLAY "Y/N?".
           ACCEPT ANS
           IF ANS NOT = "Y" GO TO P1.
           MOVE "01" TO KEEPTYPE
           IF G-GARNAME = G-PRNAME
           MOVE NEW-NAME TO G-PRNAME.
           IF G-GARNAME = G-SENAME
           MOVE NEW-NAME TO G-SENAME.
           MOVE GARFILE01 TO KEEPBACK02
           WRITE KEEPBACK01.
           MOVE G-GARNO TO GG
           MOVE G-GARNO TO SAVEGARNO
           MOVE NEW-3 TO GG-1
           MOVE GG TO G-GARNO.
       P1-9.
           READ GARFILE INVALID GO TO P2.
           DISPLAY G-GARNO " " G-GARNAME " ALREADY USED!!!"
           DISPLAY "YOU PICK IT OR END".
           ACCEPT G-GARNO
           IF G-GARNO = "END" GO TO P9.
           MOVE G-GARNO TO GG
           MOVE NEW-3 TO  GG-1
           MOVE GG TO G-GARNO
           GO TO P1-9.
       P2. MOVE KEEPBACK02 TO GARFILE01
           MOVE GG TO G-GARNO.
           MOVE NEW-NAME TO G-GARNAME
           WRITE GARFILE01 INVALID DISPLAY "CANT WRITE NEW GARNO".
      *    GO TO P9.
       P3. MOVE SAVEGARNO TO CD-KEY8
           MOVE "000" TO CD-KEY3.
       P3-0.
           START CHARFILE KEY > CHARFILE-KEY INVALID GO TO P4.
       P3-1. READ CHARFILE NEXT AT END GO TO P4.
           IF CD-KEY8 NOT = SAVEGARNO GO TO P4.
           MOVE CHARFILE-KEY TO HOLDKEY11
           MOVE "02" TO KEEPTYPE
           MOVE SPACE TO KEEPBACK02
           MOVE CHARFILE01 TO KEEPBACK02
           WRITE KEEPBACK01
           MOVE GG TO CD-KEY8
           IF CD-PATID1 = "G" MOVE GG TO CD-PATID
           MOVE NEW-NAME TO CD-NAME.
           WRITE CHARFILE01 INVALID DISPLAY "CANT WRITE CD-CHARGE".
      *    GO TO P9.
           MOVE HOLDKEY11 TO CHARFILE-KEY
           DISPLAY "CHARFILE RECORD"
           GO TO P3-0.
       P4. MOVE SAVEGARNO TO PD-KEY8
           MOVE "000" TO PD-KEY3.
       P4-0.
           START PAYFILE KEY > PAYFILE-KEY INVALID GO TO P5.
       P4-1. READ PAYFILE NEXT AT END GO TO P5.
           IF PD-KEY8 NOT = SAVEGARNO GO TO P5.
           MOVE PAYFILE-KEY TO HOLDKEY11
           MOVE "03" TO KEEPTYPE
           MOVE SPACE TO KEEPBACK02
           MOVE PAYFILE01 TO KEEPBACK02
           WRITE KEEPBACK01
           MOVE GG TO PD-KEY8
           MOVE NEW-NAME TO PD-NAME
           WRITE PAYFILE01 INVALID DISPLAY "CANT WRITE PD-PAY".
      *    GO TO P9.
           MOVE HOLDKEY11 TO PAYFILE-KEY
           DISPLAY "PAYFILE RECORD"
           GO TO P4-0.
       P5. MOVE SAVEGARNO TO CC-KEY8
           MOVE "000" TO CC-KEY3.
       P5-0.
           START CHARCUR KEY > CHARCUR-KEY INVALID GO TO P6.
       P5-1. READ CHARCUR NEXT AT END GO TO P6.
           IF CC-KEY8 NOT = SAVEGARNO GO TO P6.
           MOVE CHARCUR-KEY TO HOLDKEY11
           MOVE "04" TO KEEPTYPE
           MOVE SPACE TO KEEPBACK02
           MOVE CHARCUR01 TO KEEPBACK02
           WRITE KEEPBACK01
           MOVE GG TO CC-KEY8
           IF CC-PATID1 = "G" MOVE GG TO CC-PATID.
           WRITE CHARCUR01 INVALID DISPLAY "CANT WRITE CC-CHARGE".
      *    GO TO P9.
           MOVE HOLDKEY11 TO CHARCUR-KEY
           DISPLAY "CHARCUR RECORD"
           GO TO P5-0.
       P6. MOVE SAVEGARNO TO PC-KEY8
           MOVE "000" TO PC-KEY3.
       P6-0.
           START PAYCUR KEY > PAYCUR-KEY INVALID GO TO P7.
       P6-1. READ PAYCUR NEXT AT END GO TO P7.
           IF PC-KEY8 NOT = SAVEGARNO GO TO P7.
           MOVE PAYCUR-KEY TO HOLDKEY11
           MOVE "05" TO KEEPTYPE
           MOVE SPACE TO KEEPBACK02
           MOVE PAYCUR01 TO KEEPBACK02
           WRITE KEEPBACK01
           MOVE GG TO PC-KEY8
           IF CC-PATID1 = "G" MOVE GG TO CC-PATID.
           WRITE PAYCUR01 INVALID DISPLAY "CANT WRITE PC-CHARGE".
      *    GO TO P9.
           MOVE HOLDKEY11 TO PAYCUR-KEY
           DISPLAY "PAYCUR RECORD"
           GO TO P6-0.
       P7. MOVE SAVEGARNO TO CM-KEY8
           MOVE "000" TO CM-KEY3.
       P7-0.
           START CMNTFILE KEY > CMNT-KEY INVALID GO TO P8.
       P7-1. READ CMNTFILE NEXT AT END GO TO P8.
           IF CM-KEY8 NOT = SAVEGARNO GO TO P8.
           MOVE CMNT-KEY TO HOLDKEY11
           MOVE "06" TO KEEPTYPE
           MOVE SPACE TO KEEPBACK02
           MOVE CMNTFILE01 TO KEEPBACK02
           WRITE KEEPBACK01
           MOVE GG TO CM-KEY8
           WRITE CMNTFILE01 INVALID DISPLAY "CANT WRITE CM-CMNTFILE".
      *    GO TO P9.
           MOVE HOLDKEY11 TO CMNT-KEY
           DISPLAY "CMNTFILE RECORD"
           GO TO P7-0.
       P8. MOVE SAVEGARNO TO P-GARNO.
       P8-0.
           START PATFILE KEY NOT < P-GARNO INVALID GO TO P10.
       P8-1. READ PATFILE NEXT AT END GO TO P10.
           IF P-GARNO NOT = SAVEGARNO GO TO P10.
           MOVE P-GARNO TO HOLDKEY11
           MOVE "07" TO KEEPTYPE
           MOVE SPACE TO KEEPBACK02
           MOVE PATFILE01 TO KEEPBACK02
           WRITE KEEPBACK01
           MOVE GG TO P-GARNO
           REWRITE PATFILE01 INVALID DISPLAY "CANT WRITE P-PATFILE"
           GO TO P9.
           MOVE HOLDKEY11 TO P-GARNO
           DISPLAY "PATFILE RECORD"
           GO TO P8-0.
       P10. MOVE SAVEGARNO TO HS-KEY8
           MOVE SPACE TO HS-CLAIM
           MOVE SPACE TO HS-REC-TYPE
           MOVE SPACE TO HS-KEY4.
       P10-0.
           START HISFILE KEY > HISFILE-KEY INVALID GO TO P11.
       P10-1. READ HISFILE NEXT AT END GO TO P11.
           IF HS-KEY8 NOT = SAVEGARNO GO TO P11.
           MOVE HISFILE-KEY TO HOLDKEY19
           MOVE "08" TO KEEPTYPE
           MOVE SPACE TO KEEPBACK02
           MOVE HISFILE01 TO KEEPBACK02
           WRITE KEEPBACK01
           MOVE GG TO HS-KEY8
           IF HS-PATID1 = "G" MOVE GG TO HS-PATID.
           WRITE HISFILE01 INVALID DISPLAY "CANT WRITE HS-CHARGE".
      *    GO TO P9.
           MOVE HOLDKEY19 TO HISFILE-KEY
           DISPLAY "HISFILE RECORD"
           GO TO P10-0.
       P11. MOVE SAVEGARNO TO AUTH-KEY8.
            MOVE SPACE TO AUTH-KEY6.
       P11-0.
           START AUTHFILE KEY > AUTH-KEY INVALID GO TO P12.
       P11-1. READ AUTHFILE NEXT AT END GO TO P12.
           IF AUTH-KEY8 NOT = SAVEGARNO GO TO P12.
           MOVE AUTH-KEY TO HOLDKEY14
           MOVE "09" TO KEEPTYPE
           MOVE SPACE TO KEEPBACK02
           MOVE AUTHFILE01 TO KEEPBACK02
           WRITE KEEPBACK01
           MOVE GG TO AUTH-KEY8
           WRITE AUTHFILE01 INVALID DISPLAY "CANT WRITE AUTHFILE".
      *    GO TO P9.
           MOVE HOLDKEY14 TO AUTH-KEY
           DISPLAY "AUTHFILE RECORD"
           GO TO P11-0.
       P12.
           MOVE SAVEGARNO TO MPLR-KEY.
           READ MPLRFILE INVALID GO TO P9.
           MOVE "10" TO KEEPTYPE
           MOVE SPACE TO KEEPBACK02
           MOVE MPLRFILE01 TO KEEPBACK02
           WRITE KEEPBACK01
           MOVE GG TO MPLR-KEY
           WRITE MPLRFILE01 INVALID DISPLAY "CANT WRITE MLRLFILE".
      *    GO TO P9.
       P9. CLOSE CHARFILE CHARCUR PAYFILE PAYCUR GARFILE PATFILE
           CMNTFILE HISFILE AUTHFILE MPLRFILE.
           DISPLAY "GARNAME PROGRAM HAS ENDED."
           STOP RUN.
