      * @package cms
      * @link    http://www.cmsvt.com
      * @author  s waite <cmswest@sover.net>
      * @copyright Copyright (c) 2020 cms <cmswest@sover.net>
      * @license https://github.com/openemr/openemr/blob/master/LICENSE GNU General Public License 3
       IDENTIFICATION DIVISION.
       PROGRAM-ID. rrr250.
       AUTHOR. S WAITE.
       DATE-COMPILED. TODAY.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ACTFILE ASSIGN TO "S30" ORGANIZATION IS INDEXED
             ACCESS MODE IS DYNAMIC RECORD KEY IS A-ACTNO
             ALTERNATE RECORD KEY IS A-GARNO WITH DUPLICATES
             ALTERNATE RECORD KEY IS NAME-KEY WITH DUPLICATES
             LOCK MODE MANUAL.

           SELECT GARFILE ASSIGN TO "S35" ORGANIZATION IS INDEXED
             ACCESS MODE IS DYNAMIC RECORD KEY IS G-GARNO
             ALTERNATE RECORD KEY IS G-ACCT WITH DUPLICATES
             LOCK MODE MANUAL.
      *       STATUS IS GAR-STAT.

           SELECT ORDFILE ASSIGN TO "S40" ORGANIZATION IS INDEXED
             ACCESS MODE IS DYNAMIC RECORD KEY IS ORDNO
             ALTERNATE RECORD KEY IS C-DATE-E WITH DUPLICATES
             LOCK MODE MANUAL.

           SELECT PROCFILE ASSIGN TO "S45" ORGANIZATION IS INDEXED
             ACCESS MODE IS DYNAMIC RECORD KEY IS PROC-KEY
             LOCK MODE MANUAL.

           SELECT CHARFILE ASSIGN TO "S50" ORGANIZATION IS INDEXED
             ACCESS MODE IS DYNAMIC RECORD KEY IS CHARFILE-KEY
             LOCK MODE MANUAL.

           SELECT CLAIMFILE ASSIGN TO "S55" ORGANIZATION IS INDEXED
             ACCESS IS DYNAMIC RECORD KEY IS CLAIM-KEY
             STATUS IS CLM-STAT
             LOCK MODE MANUAL.

           SELECT ORD-DELETES ASSIGN TO "S60" ORGANIZATION IS LINE
             SEQUENTIAL.

           SELECT NEW-GARNOS ASSIGN TO "S70" ORGANIZATION IS LINE
             SEQUENTIAL.

           SELECT WORK249 ASSIGN TO "S75" ORGANIZATION LINE
             SEQUENTIAL.

           SELECT FILEIN ASSIGN TO "S80" ORGANIZATION LINE
             SEQUENTIAL.

           SELECT INSFILE ASSIGN TO "S85" ORGANIZATION IS INDEXED
             ACCESS IS DYNAMIC RECORD KEY IS INS-KEY
             ALTERNATE RECORD KEY IS INS-NAME WITH DUPLICATES
             ALTERNATE RECORD KEY IS INS-CITY WITH DUPLICATES
             ALTERNATE RECORD KEY IS INS-ASSIGN WITH DUPLICATES
             ALTERNATE RECORD KEY IS INS-CLAIMTYPE WITH DUPLICATES
             ALTERNATE RECORD KEY IS INS-NEIC WITH DUPLICATES
             ALTERNATE RECORD KEY IS INS-NEIC-ASSIGN WITH DUPLICATES
             LOCK MODE MANUAL.
          
       DATA DIVISION.
       FILE SECTION.

       FD  INSFILE
           DATA RECORD IS INSFILE01.
       01  INSFILE01.
           02 INS-KEY PIC XXX.
           02 INS-NAME PIC X(22).
           02 INS-STREET PIC X(24).
           02 INS-CITY PIC X(15).
           02 INS-STATE PIC XX.
           02 INS-ZIP PIC X(9).
           02 INS-ASSIGN PIC X.
           02 INS-CLAIMTYPE PIC X.
           02 INS-NEIC PIC X(5).
           02 INS-NEICLEVEL PIC X.
           02 INS-NEIC-ASSIGN PIC X.
           02 INS-PPO PIC X.
           02 INS-PRVNUM PIC X(10).
           02 INS-HMO PIC X(3).
           02 INS-STATUS PIC X.
           02 INS-LEVEL PIC X.
           02 INS-LASTDATE PIC X(8).
           02 INS-CAID PIC XXX.
           02 INS-REFWARN PIC X.
           02 INS-FUTURE PIC X(8).

       FD  CHARFILE
           DATA RECORD IS CHARFILE01.
       01  CHARFILE01.
           02 CHARFILE-KEY.
             03 CD-KEY8 PIC X(8).
             03 CD-KEY3 PIC XXX.
           02 CD-PATID PIC X(8).
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
           02 CD-AGE PIC X.
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
           02 CD-CLINICAL PIC X(40).
           02 CD-ADMIT-DIAG PIC X(30).

       FD GARFILE
           DATA RECORD IS GARFILE01.
       01 GARFILE01.
           02 G-GARNO.
             03 ID1 PIC XXX.
             03 ID2 PIC XXX.
             03 ID3 PIC X.
             03 ID4 PIC X.
           02 G-GARNAME.
             03 G-GN1 PIC XXX.
             03 G-GN2 PIC X(21).
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
           02 G-PR-GROUP PIC X(10).
           02 G-PRIPOL PIC X(16).
           02 G-PRNAME PIC X(24).
           02 G-PR-RELATE PIC X.
           02 G-SE-MPLR PIC X(4).
           02 G-SEINS PIC XXX.
           02 G-SE-ASSIGN PIC X.
           02 G-SE-OFFICE PIC X(4).
           02 G-SE-GROUP PIC X(10).
           02 G-SECPOL PIC X(16).
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

       FD ACTFILE
           DATA RECORD IS ACTFILE01.
       01 ACTFILE01.
           02 A-ACTNO PIC X(8).
           02 A-GARNAME.
             03 A-GN1 PIC XXX.
             03 A-GN2 PIC X(21).
           02 A-BILLADD PIC X(22).
           02 A-STREET PIC X(22).
           02 A-CITY PIC X(18).
           02 A-STATE PIC X(2).
           02 A-ZIP.
             03 A-ZIP5 PIC X(5).
             03 A-ZIP4 PIC X(4).
           02 A-COLLT PIC X.
           02 A-PHONE.
             03 A-PHONE1 PIC XXX.
             03 A-PHONE2 PIC XXX.
             03 A-PHONE3 PIC X(4).
           02 A-SEX PIC X.
           02 A-RELATE PIC X.
           02 A-MSTAT PIC X.
           02 A-DOB PIC X(8).
           02 A-DUNNING PIC X.
           02 A-ACCTSTAT PIC X.
           02 A-PR-MPLR PIC X(4).
           02 A-PRINS PIC XXX.
           02 A-PR-ASSIGN PIC X.
           02 A-PR-OFFICE PIC X(4).
           02 A-PR-GROUP PIC X(10).
           02 A-PRIPOL0.
             03 A-PRIPOL PIC X(9).
             03 A-PR-SUFX PIC XXX.
             03 A-PR-FILLER PIC X(4).
           02 A-PRNAME PIC X(24).
           02 A-PR-RELATE PIC X.
           02 A-SE-MPLR PIC X(4).
           02 A-SEINS PIC XXX.
           02 A-SE-ASSIGN PIC X.
           02 A-SE-OFFICE PIC X(4).
           02 A-SE-GROUP PIC X(10).
           02 A-SECPOL0.
             03 A-SECPOL PIC X(9).
             03 A-SE-SUFX PIC XXX.
             03 A-SE-FILLER PIC X(4).
           02 A-SENAME PIC X(24).
           02 A-SE-RELATE PIC X.
           02 A-INSPEND PIC X(7).
           02 A-LASTBILL PIC X(8).
           02 A-ASSIGNM PIC X.
           02 A-PRIVATE PIC X.
           02 A-BILLCYCLE PIC X.
           02 A-DELETE PIC X.
           02 A-FILLER PIC XXX.
           02 A-GARNO PIC X(8).
           02 A-PRGRPNAME PIC X(15).
           02 A-SEGRPNAME PIC X(15).
           02 NAME-KEY PIC XXX.

       FD  FILEIN.
       01  FILEIN01 PIC X(8).

       FD  WORK249.
       01  WORK24901 PIC X(8).
       
       FD  NEW-GARNOS.
       01  NEW-GARNOS01.
           02 NEW-GARNOS2 PIC X(8).
           02 NEW-GARNOS1 PIC X(8).

       FD  ORD-DELETES.
       01  ORD-DELETES01 PIC X(11).

       FD  CLAIMFILE
           DATA RECORD IS CLAIM01.
       01  CLAIM01.
           02 CLAIM-KEY PIC X.
           02 CLAIMNO PIC 9(6).

       FD  PROCFILE
           DATA RECORD PROCFILE01.
       01  PROCFILE01.
           02 PROC-KEY.
             03 PK1 PIC X(4).
             03 PK2 PIC X(5).
             03 PK3 PIC XX.
           02 PROC-TYPE PIC X.
           02 PROC-TITLE PIC X(28).
           02 PROC-AMOUNT PIC 9(4)V99.
     
       FD  ORDFILE
           DATA RECORD IS ORDFILE01.
       01  ORDFILE01.
           02 ORDNO.
             03 ORD8 PIC X(8).
             03 ORD3 PIC XXX.
           02 CHARGE1 PIC X(4).
           02 CHARGE2 PIC X.
           02 C-REF PIC XXX.
           02 C-IOPAT PIC X.
           02 C-DATE-A PIC X(8).
           02 C-DATE-T PIC X(8).
           02 C-DATE-ADMIT PIC X(8).
           02 C-ORDER PIC XXXX.
           02 C-CLINICAL PIC X(38).
           02 C-DOCP PIC XX.
           02 C-ADMIT-DIAG PIC X(24).
           02 C-MOD2 PIC XX.
           02 C-MOD3 PIC XX.
           02 C-MOD4 PIC XX.           
           02 C-DATE-E PIC X(8).
           02 C-CPT PIC X(5).

       WORKING-STORAGE SECTION.
       01  ANS PIC X.
       01  GAR-STAT PIC XX.
       01  CLM-STAT PIC XX.
       01  CHARBACK PIC X(258).
       01  INPUT-DATE-S.      
           05 T-MM  PIC 99.
           05 T-DD  PIC 99.
           05 T-CC  PIC 99.
           05 T-YY  PIC 99.
       01  TEST-DATE-S.
           05 T-CC  PIC 99.
           05 T-YY  PIC 99.
           05 T-MM  PIC 99.
           05 T-DD  PIC 99.
       01 DATE-X PIC X(8).
       01     NAME-CYCLE.
             03 NC1 PIC X.
             03 NC2 PIC X.
             03 FILLER PIC X(22).
       01     YEARDAY.
             03 YEAR-1.
               04 YD1 PIC X.
               04 YD2 PIC X.
             03 DAY3 PIC XXX.
       01 NUM-3 PIC 999.
       01  XYZ PIC 9.
       01  XXX PIC 999 VALUE 0.
       01  GARBACK.
           02 HOLD-GARNO PIC X(8).
           02 FILLER PIC X(301).
       01  CNTR PIC 99 VALUE 0.
       01  CINS.
           02 CINS1 PIC X.
           02 CINS2 PIC XX.
       01  FLAG5999 PIC 9 VALUE 0.
       01  X-COLLT PIC X.
       01  X-DUNNING PIC X.
       01  X-ACCTSTAT PIC X.
       01  X-INSPEND PIC S9(5)V99.
       01  X-LASTBILL PIC X(8).
       01  X-BILLCYCLE PIC X.
       01   X-PRINS    PIC XXX.
       01   X-PR-ASSIGN PIC X.
       01   X-PRIPOL  PIC X(16).
       01   X-PR-GROUP PIC X(10).
       01   X-PRNAME  PIC X(24).
       01   X-PR-RELATE PIC X.
       01   X-SEINS    PIC XXX.
       01   X-SE-ASSIGN PIC X.
       01   X-SECPOL  PIC X(16).
       01   X-SE-GROUP PIC X(10).
       01   X-SENAME  PIC X(24).
       01   X-SE-RELATE PIC X.
       01  LNAME PIC X(24).
       01  FNAME PIC X(24).
       01  MNAME PIC X(24).
       01  LNAME2 PIC X(24).
       01  FNAME2 PIC X(24).
       01  MNAME2 PIC X(24).
       01  FLAGPROC PIC 9.

      *
       PROCEDURE DIVISION.

       0005-START.
           OPEN INPUT ACTFILE ORDFILE PROCFILE WORK249 FILEIN INSFILE.
           OPEN I-O GARFILE CHARFILE CLAIMFILE.
           OPEN OUTPUT ORD-DELETES NEW-GARNOS.
           MOVE "A" TO CLAIM-KEY
           READ CLAIMFILE WITH LOCK
             INVALID
               DISPLAY "CLAIMFILE IS BAD. THIS PROG. IS TERMINATED"
               GO TO P11
           END-READ

           IF CLM-STAT = "61"
               DISPLAY "CLAIMFILE IS BEING WRITTEN"
               DISPLAY "TRY 250 RUN WHEN CLAIMFILE IS FREE"
               GO TO P11
           END-IF

           READ FILEIN
             AT END
               DISPLAY "NO HIGH DATE RECORD."
               GO TO P11
           END-READ.

       P1. 
           READ WORK249
             AT END
               GO TO P11
           END-READ

           IF WORK24901 NOT NUMERIC 
               DISPLAY WORK24901 " NON-NUMERIC ACCOUNT"
               ACCEPT X-ACCTSTAT
               GO TO P1
           END-IF

           MOVE WORK24901 TO A-ACTNO
           READ ACTFILE
             INVALID
               DISPLAY "BAD ACCT " A-ACTNO " SHOULD NEVER HAPPEN!"
               ACCEPT X-ACCTSTAT
               GO TO P1
           END-READ           

           IF (A-GARNO = SPACE)
             GO TO P2
           END-IF

           MOVE A-GARNO TO G-GARNO.

       P1-0.

           READ GARFILE WITH LOCK
             INVALID
               DISPLAY A-GARNO " " A-ACTNO
               DISPLAY "INVALID GARNO, A NEW ACCOUNT WILL BE CREATED"
               ACCEPT OMITTED                      
               GO TO P2
           END-READ           

           IF (G-DUNNING NOT = "1" AND G-PRINS NOT = "003")
               DISPLAY G-GARNO " " G-GARNAME " NEW ACCOUNT STARTED"
                 " SINCE GARNO WAS IN COLLECTION"
               ACCEPT OMITTED      
               GO TO P2
           END-IF

           GO TO REWRITE-NEW.

       P2. 

           MOVE ACTFILE01 TO GARFILE01
           MOVE A-ACTNO TO G-ACCT
           ACCEPT YEARDAY FROM DAY.
           MOVE YD2 TO G-PRIVATE.
           MOVE G-GARNAME TO NAME-CYCLE.
           MOVE "4" TO G-BILLCYCLE.

           IF NC1 = "1" MOVE NC2 TO NC1.
           
           IF NC1 < "T" MOVE "3" TO G-BILLCYCLE.
           
           IF NC1 < "K" MOVE "2" TO G-BILLCYCLE.
           
           IF NC1 < "F" MOVE "1" TO G-BILLCYCLE.

       P3.
           MOVE SPACE TO G-GARNO.
           MOVE GARFILE01 TO GARBACK
           MOVE DAY3 TO ID2 NUM-3.
           MOVE G-GN1 TO ID1.
           MOVE 0 TO XYZ.
           MOVE "G" TO ID4.

       P4.
           ADD 1 TO XYZ.
           MOVE XYZ TO ID3.
           MOVE G-GARNO TO HOLD-GARNO.
           READ GARFILE
             INVALID KEY 
               GO TO P5
           END-READ

           IF XYZ = 9 
               ADD 1 TO NUM-3
               MOVE NUM-3 TO ID2
               MOVE 0 TO XYZ
           END-IF
           
           GO TO P4.

       P5.

           MOVE GARBACK TO GARFILE01.
           
           IF G-PRINS = "003" AND G-SEINS = "076"
               MOVE "662" TO G-SEINS
               MOVE "A" TO G-SE-ASSIGN
           END-IF
           
           MOVE HOLD-GARNO TO A-GARNO.
           IF (G-PRINS = "003" AND G-SEINS = "715")
               MOVE "062" TO G-SEINS
               MOVE "A" TO G-SE-ASSIGN
               MOVE SPACE TO G-PR-GROUP
               MOVE "0099001" TO G-PR-GROUP
           END-IF

           MOVE "1" TO G-DELETE
           IF (G-PRINS = "003") AND (G-SEINS = "108" OR "116")
               MOVE SPACE TO G-PR-GROUP
               MOVE "0000567" TO G-PR-GROUP
               MOVE "062" TO G-SEINS
           END-IF

           MOVE SPACE TO LNAME FNAME MNAME
               LNAME2 FNAME2 MNAME2
           UNSTRING G-GARNAME DELIMITED BY ";" INTO
               LNAME FNAME MNAME
           UNSTRING G-PRNAME DELIMITED BY ";" INTO
               LNAME2 FNAME2 MNAME2

           IF LNAME = LNAME2
               AND FNAME = FNAME2
               AND G-RELATE NOT = G-PR-RELATE
               MOVE G-GARNAME TO G-PRNAME
               MOVE G-RELATE TO G-PR-RELATE
           END-IF
           
           INSPECT G-STREET REPLACING ALL ":" BY " ".
           INSPECT G-BILLADD REPLACING ALL ":" BY " ".
           WRITE GARFILE01
             INVALID
               DISPLAY "NO UPDATE " G-GARNO
               ACCEPT CD-DX3
               GO TO P1
           END-WRITE

      *     IF GAR-STAT = "61" GO TO P4.
           MOVE HOLD-GARNO TO NEW-GARNOS2
           MOVE A-ACTNO TO NEW-GARNOS1 
           WRITE NEW-GARNOS01.
           CLOSE ACTFILE
           OPEN I-O ACTFILE
           READ ACTFILE WITH LOCK.
           MOVE HOLD-GARNO TO A-GARNO
           REWRITE ACTFILE01
           CLOSE ACTFILE
           OPEN INPUT ACTFILE.

       P5-0.
           MOVE G-PRINS TO INS-KEY
           READ INSFILE
             INVALID
               DISPLAY G-GARNO " " G-PRINS " " G-GARNAME 
                 "  HAS AN INVALID PRIMARY INSURANCE"
               DISPLAY " FIX THIS IN GP AND LET STEVE KNOW"
               ACCEPT OMITTED    
               MOVE "001" TO G-PRINS
           END-READ

           MOVE G-GARNO TO CD-PATID
           MOVE "0000000" TO CD-DIAG CD-DX2 CD-DX3 CD-DX4
           MOVE SPACE TO CD-MOD2 CD-MOD3 CD-MOD4 CD-DX5 CD-DX6
           
           MOVE G-PRINS TO CD-PAYCODE
           MOVE "0" TO CD-STAT
           MOVE "01" TO CD-WORK
           MOVE "1" TO CD-RESULT
           MOVE "4" TO CD-ACT
           MOVE "2" TO CD-SORCREF
           MOVE "0" TO CD-COLLT
           MOVE "0" TO CD-AGE
           MOVE G-GARNAME TO CD-NAME
           MOVE "0" TO CD-ESPDT
           MOVE "00000000" TO CD-DATE-A
           MOVE " " TO CD-ACC-TYPE
           MOVE INS-CLAIMTYPE TO CD-PAPER
           MOVE INS-ASSIGN TO CD-ASSIGN
           MOVE INS-NEIC-ASSIGN TO CD-NEIC-ASSIGN.

       P6. 
           MOVE A-ACTNO TO ORD8  
           MOVE "   " TO ORD3.
           
           START ORDFILE KEY NOT < ORDNO
             INVALID
               GO TO P1
           END-START

           MOVE G-GARNAME TO CD-NAME
           MOVE 0 TO XXX
           MOVE G-GARNO TO CD-KEY8 
           MOVE "000" TO CD-KEY3.

       P7. 
           READ ORDFILE NEXT
             AT END
               GO TO P1
           END-READ

           IF ORD8 NOT = A-ACTNO
               GO TO P1
           END-IF

           IF CHARGE2 = "-"
               GO TO P7
           END-IF

           MOVE C-DOCP TO CD-DOCP
           MOVE C-REF TO CD-DOCR
           MOVE C-DATE-A TO CD-DAT1.
           MOVE C-IOPAT TO CD-PLACE
           MOVE C-DATE-T TO CD-DATE-T.
           MOVE C-DATE-ADMIT TO CD-DATE-M
           MOVE C-CLINICAL TO CD-CLINICAL
           MOVE C-ADMIT-DIAG TO CD-ADMIT-DIAG
           ACCEPT CD-DATE-E FROM CENTURY-DATE.

           MOVE CHARGE1 TO PK1
           MOVE C-CPT TO PK2
           MOVE "26" TO PK3.
           
       P8. 
           READ PROCFILE 
            INVALID
               MOVE "  " TO PK3
               READ PROCFILE
                 INVALID
                   GO TO P8-EXIT
               END-READ    
           END-READ

           MOVE PROC-KEY TO CD-PROC           
           MOVE C-MOD2 TO CD-MOD2
           MOVE C-MOD3 TO CD-MOD3
           MOVE C-MOD4 TO CD-MOD4
           MOVE PROC-AMOUNT TO CD-AMOUNT
           MOVE PROC-TYPE TO CD-SERVICE
           ACCEPT CD-ORDER FROM TIME

           ADD 1 TO CLAIMNO 
           MOVE CLAIMNO TO CD-CLAIM
           MOVE CHARFILE01 TO CHARBACK.

       P9.
           ADD 1 TO XXX 
           MOVE XXX TO CD-KEY3
           READ CHARFILE
             INVALID
               GO TO P10
           END-READ

           GO TO P9.

       P10.
           MOVE CHARBACK TO CHARFILE01
           MOVE XXX TO CD-KEY3.
           MOVE "01" TO CD-WORK
           WRITE CHARFILE01. 
           WRITE ORD-DELETES01 FROM ORDNO
           GO TO P7.
       
       P8-EXIT.
           DISPLAY CD-NAME
           DISPLAY C-CPT
           DISPLAY CD-DATE-T
           DISPLAY "NON MATCHING CPT BETWEEN HOSPRRI AND PROCFILE"
           DISPLAY "FOR HOSP CODE " PK1 "." 
           DISPLAY "THIS RECORD WILL BE DISCARDED"
           DISPLAY "BUT MUST BE CORRECTED IN HOSPRRI AND USED"
           DISPLAY "NOTIFY STEPHEN IMMEDIATELY."
           ACCEPT OMITTED
           GO TO P7.

       REWRITE-NEW. 

      * save some G details
           MOVE G-COLLT TO X-COLLT
           MOVE G-DUNNING TO X-DUNNING
           MOVE G-ACCTSTAT TO X-ACCTSTAT
           MOVE G-INSPEND TO X-INSPEND
           MOVE G-LASTBILL TO X-LASTBILL
           MOVE G-BILLCYCLE TO X-BILLCYCLE
      * overwrite garfile with actfile and bring billing details back
      * and the garno from actfile
           MOVE ACTFILE01 TO GARFILE01
           MOVE A-GARNO TO G-GARNO
           MOVE A-ACTNO TO G-ACCT
           MOVE X-COLLT TO G-COLLT
           MOVE X-DUNNING TO G-DUNNING
           MOVE X-ACCTSTAT TO G-ACCTSTAT
           MOVE X-INSPEND TO G-INSPEND
           MOVE X-LASTBILL TO G-LASTBILL
           MOVE X-BILLCYCLE TO G-BILLCYCLE
           MOVE "1" TO G-DELETE

           IF NOT (G-BILLCYCLE = "1" OR "2" OR "3" OR "4")
               MOVE "1" TO G-BILLCYCLE
           END-IF    
           
           IF (G-PRINS = "003") AND (G-SEINS = "108" OR "116")
               MOVE SPACE TO G-PR-GROUP
               MOVE "0000567" TO G-PR-GROUP
               MOVE "062" TO G-SEINS
           END-IF    
           
           MOVE SPACE TO LNAME FNAME MNAME LNAME2 FNAME2 MNAME2
           UNSTRING G-GARNAME DELIMITED BY ";" INTO LNAME FNAME MNAME
           UNSTRING G-PRNAME DELIMITED BY ";" INTO LNAME2 FNAME2 MNAME2
           
           IF (LNAME = LNAME2 AND FNAME = FNAME2
             AND G-RELATE NOT = G-PR-RELATE)
             MOVE G-GARNAME TO G-PRNAME
             MOVE G-RELATE TO G-PR-RELATE
           END-IF
           
           INSPECT G-BILLADD REPLACING ALL ":" BY " ".
           INSPECT G-STREET REPLACING ALL ":" BY " ".

           REWRITE GARFILE01
             INVALID 
               DISPLAY "NO REWRITE ON " G-GARNO
               DISPLAY "CHARGE(S) WILL BE LOST! CALL STEVE."
               ACCEPT ANS
               GO TO P1
           END-REWRITE    

           GO TO P5-0.

       P11.
           REWRITE CLAIM01.
           
           IF CLM-STAT = "61" 
               DISPLAY CLAIM01
               GO TO P11
           END-IF    
           
           CLOSE ACTFILE ORDFILE PROCFILE WORK249 FILEIN INSFILE
               GARFILE CHARFILE CLAIMFILE ORD-DELETES NEW-GARNOS.
           DISPLAY "POSTING PROGRAM HAS ENDED".
           STOP RUN.
