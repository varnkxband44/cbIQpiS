file handle pcdat/name='default.dat' /lrecl=24.
data list file pcdat free /
  R0000100 (F4)
  R0536300 (F2)
  R0536401 (F2)
  R0536402 (F4)
  R1235800 (F2)
  R1482600 (F2)
.
* The following code works with current versions of SPSS.
missing values all (-5 thru -1).
* older versions of SPSS may require this:
* recode all (-5,-3,-2,-1=-4).
* missing values all (-4).
variable labels
  R0000100  "PUBID - YTH ID CODE 1997"
  R0536300  "KEY!SEX (SYMBOL) 1997"
  R0536401  "KEY!BDATE M/Y (SYMBOL) 1997"
  R0536402  "KEY!BDATE M/Y (SYMBOL) 1997"
  R1235800  "CV_SAMPLE_TYPE 1997"
  R1482600  "KEY!RACE_ETHNICITY (SYMBOL) 1997"
.

* Recode continuous values. 
* recode 
 R0000100 
    (0 thru 0 eq 0)
    (1 thru 999 eq 1)
    (1000 thru 1999 eq 1000)
    (2000 thru 2999 eq 2000)
    (3000 thru 3999 eq 3000)
    (4000 thru 4999 eq 4000)
    (5000 thru 5999 eq 5000)
    (6000 thru 6999 eq 6000)
    (7000 thru 7999 eq 7000)
    (8000 thru 8999 eq 8000)
    (9000 thru 9999 eq 9000)
.

* value labels
 R0000100
    0 "0"
    1 "1 TO 999"
    1000 "1000 TO 1999"
    2000 "2000 TO 2999"
    3000 "3000 TO 3999"
    4000 "4000 TO 4999"
    5000 "5000 TO 5999"
    6000 "6000 TO 6999"
    7000 "7000 TO 7999"
    8000 "8000 TO 8999"
    9000 "9000 TO 9999"
    /
 R0536300
    1 "Male"
    2 "Female"
    0 "No Information"
    /
 R0536401
    1 "1: January"
    2 "2: February"
    3 "3: March"
    4 "4: April"
    5 "5: May"
    6 "6: June"
    7 "7: July"
    8 "8: August"
    9 "9: September"
    10 "10: October"
    11 "11: November"
    12 "12: December"
    /
 R1235800
    1 "Cross-sectional"
    0 "Oversample"
    /
 R1482600
    1 "Black"
    2 "Hispanic"
    3 "Mixed Race (Non-Hispanic)"
    4 "Non-Black / Non-Hispanic"
    /
.
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME VARIABLES statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */  /* *start* */

* RENAME VARIABLES
  (R0000100 = PUBID_1997) 
  (R0536300 = KEY_SEX_1997)   /* KEY!SEX */
  (R0536401 = KEY_BDATE_M_1997)   /* KEY!BDATE_M */
  (R0536402 = KEY_BDATE_Y_1997)   /* KEY!BDATE_Y */
  (R1235800 = CV_SAMPLE_TYPE_1997) 
  (R1482600 = KEY_RACE_ETHNICITY_1997)   /* KEY!RACE_ETHNICITY */
.
  /* *end* */

descriptives all.

*--- Tabulations using reference number variables.
*freq var=R0000100, 
  R0536300, 
  R0536401, 
  R0536402, 
  R1235800, 
  R1482600.

*--- Tabulations using qname variables.
*freq var=PUBID_1997, 
  KEY_SEX_1997, 
  KEY_BDATE_M_1997, 
  KEY_BDATE_Y_1997, 
  CV_SAMPLE_TYPE_1997, 
  KEY_RACE_ETHNICITY_1997.
