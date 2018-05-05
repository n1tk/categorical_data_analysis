*SAS Cochran-Mantel-Haenszel and chi-squared WORKING CODE;

data grad;

input ed $ income $ count;

datalines;

someHS           low 9 
hsGrad           low 44
someCollege      low 13
collegeGraduate  low 10

someHS           middle 11  
hsGrad           middle 52
someCollege      middle 23
collegeGraduate  middle 22

someHS           high 9
hsGrad           high 41      
someCollege      high 12
collegeGraduate  high 27

;

proc freq data=grad;

tables ed*income/cmh chisq expected cellchi2;

weight count;

run;



*Fisher’s Exact Example 2x2 Problem 2.29 Fisher Exact test and P-value;

data exact;

input result $ treatments $ count;

datalines;

normalized treat 7

normalized control 0

not_normalized treat 8

not_normalized control 15

;

proc freq data=exact order=data;

tables result*treatments / FISHER chisq exact;

weight count;
title 'problem 2.29 on page 62 of the textbook';
run;


*Fisher’s Exact Example 2x2;

data exact;

input  treatment $ condition $ count;

datalines;

surgery            cancer_control      21
radiation_therapy  cancer_control      15

surgery            cancer_not_control  2
radiation_therapy  cancer_not_control 3


;

proc freq data=exact order=data;

tables treatment*condition / chisq;

weight count;
title 'problem 2.31 on page 62 of the textbook';

run;




*SAS Cochran-Mantel-Haenszel program for Death Penalty Data;

data penalty;

input victim $ defendant $ death $ count;

datalines;

white white yes 19

white white no 132

white black yes 0

white black no 9

black white yes 11

black white no 52

black black yes 6

black black no 97

;

proc freq data=penalty;

tables victim*defendant*death/cmh;

weight count;

title 'problem 2.33 on page 62 of the textbook';

run;




data death;
input defendant $ victim $ penalty $ count @@;
datalines;
white white yes 19 white white no 132
white black yes 0 white black no 9
black white yes 11 black white no 52
black black yes 6 black black no 97
;
run;
proc freq;
 weight count;
 tables defendant*penalty/chisq all nocol nopct;
 tables defendant*victim/chisq all;
 tables victim*penalty/chisq all;
 tables victim*defendant*penalty /chisq cmh nocol nopct;
 tables victim*defendant*penalty/chisq nocol nopct;
 title 'problem 2.33b on page 63 of the textbook all tables';
run;


data death;
input defendant $ victim $ penalty $ count @@;
datalines;
white white yes 19 white white no 132

white black yes 0 white black no 9

black white yes 11 black white no 52

black black yes 6 black black no 97
;
run;
proc freq;
 weight count;
 tables victim*defendant*penalty /chisq cmh nocol nopct;

 title 'partial tables of defendant and penalty for each level of victim, and get all the analysis for these 2x2 sub-tables table only problem 2.33b on page 63 of the textbook';
run;




data death;
input defendant $ victim $ penalty $ count @@;
datalines;
white white yes 19 
white white no 132

white black yes 0 
white black no 9

black white yes 11 
black white no 52

black black yes 6 
black black no 97
;
run;
proc freq;
 weight count;
 tables defendant*penalty/chisq all nocol nopct;

 title 'marginal table only problem 2.33c on page 63 of the textbook';
run;




*SAS Cochran-Mantel-Haenszel program for agricultural extension agents in North Carolina;

data agriculture;

input district $ race $ merit $ count;

datalines;

NC black yes 24
NC black no 9

NE black yes 10
NE black no 3

NW black yes 5
NW black no 4

SE black yes 16
SE black no 7

SW black yes 7 
SW black no 4


NC white yes 47
NC white no 12

NE white yes 45
NE white no 8

NW white yes 57
NW white no 9

SE white yes 54 
SE white no 10

SW white yes 59
SW white no 12

;

proc freq data=agriculture;

tables district*race*merit/cmh;

weight count;

 title 'Conduct the Cochran-Mantel-Jaenszel 4.15 page 127 from the textbook';
 
run;






















