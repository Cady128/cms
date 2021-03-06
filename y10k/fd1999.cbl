      * @package cms
      * @link    http://www.cmsvt.com
      * @author  s waite <cmswest@sover.net>
      * @copyright Copyright (c) 2020 cms <cmswest@sover.net>
      * @license https://github.com/openemr/openemr/blob/master/LICENSE GNU General Public License 3
       IDENTIFICATION DIVISION.
       PROGRAM-ID. fd1001.
       AUTHOR. SID WAITE.
       DATE-COMPILED. TODAY.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FILEIN ASSIGN TO "S30" ORGANIZATION IS LINE
           SEQUENTIAL.
           SELECT FILEOUT ASSIGN TO "S40" ORGANIZATION IS LINE
           SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  FILEIN.
       01  FILEIN01.
           02 FI-ACCT PIC X(13).
           02 FILLER PIC XX.
           02 FI-NAME PIC X(25).
            02 FI-STREET PIC X(28).
           02 FILLER PIC X(231).
           02 FI-METERNUM PIC X(10).
           02 FILLER PIC X(14).
           02 FI-CURR-READ PIC X(12).
           02 FI-CURR-DATE PIC X(8).
           02 FILLER PIC X(13).
           02 FI-CURR-COMMENT PIC X(29).
           02 FI-PREV-READ PIC X(12).
       FD  FILEOUT.
       01  FILEOUT01 PIC X(400).
       WORKING-STORAGE SECTION.
       01  HOLDKEY PIC X(29).

       01  NUM11 PIC 9(11).
       PROCEDURE DIVISION.
       P0.
           OPEN INPUT FILEIN OPEN OUTPUT FILEOUT.
       P1.
           READ FILEIN AT END GO TO P99.
           DISPLAY FI-ACCT  "  FI-ACCT".
           DISPLAY FI-STREET  "  FI-STREET".
           DISPLAY FI-METERNUM "  FI-METERNUM".
           DISPLAY FI-CURR-READ "  FI-CURR-READ".
           DISPLAY FI-CURR-DATE "  FI-CURR-DATE".
           DISPLAY FI-CURR-COMMENT  "  FI-CURR-COMMENT".
           DISPLAY FI-PREV-READ "  FI-PREV-READ".
           ACCEPT OMITTED
           GO TO P1.

       P99.
           CLOSE FILEIN FILEOUT.
           STOP RUN.
