
*/problem 1 Use the data in table 7.23 on page 237 of the textbook to fit a logistic model with admission to the graduate program as the response and department and gender as the predictors.;


data grads;

input department $ gender $ admit  $ freq;

datalines;

1 male yes 512
1 male no 313
1 female yes 89
1 female no 19

2 male yes 353
2 male no 207
2 female yes 17
2 female no 8

3 male yes 120
3 male no 205
3 female yes 202
3 female no 391

4 male yes 138
4 male no 279
4 female yes 131
4 female no 244

5 male yes 53
5 male no 138
5 female yes 94
5 female no 299

6 male yes 22
6 male no 351
6 female yes 24
6 female no 317
;
run;

*/ a)	First fit the model containing only the intercept and the main effects (the linear terms) and comment on the fit of the model.;

proc logistic data=grads;
title 'proc logistic problme1a intercempt and linear terms';
class department gender admit;

model admit (event='yes')=department gender /;

weight freq;

run;

*/ test without "event";


proc logistic data=grads;
title 'proc logistic problme1a test';
class department gender admit;

model admit = department gender / expb;

weight freq;

run;


*/b)	Next, fit the model that contains the linear terms and the interaction term.  Comment on testing for lack-of-fit.;

proc logistic data=grads;
title 'proc logistic problme1b interaction term and linear terms';
class department gender admit;

model admit (event='yes')=department gender department*gender / LACKFIT;

weight freq;

run;

*/c;

proc logistic data=grads;
title 'proc logistic problme1c interaction term and linear terms';
class department gender admit;

model admit(event='yes') = gender department department*gender / ;

weight freq;
oddsratio gender;

run;

*/####################################################################################################################;

*/problem2; 
data drinkData;

input EI $ SN $ TF $ JP $  drink $ freq;

datalines;


   E  S  T  J  1   10
   E  S  T  P  1    8
   E  S  F  J  1    5
   E  S  F  P  1    7

   E  S  T  J  0    67
   E  S  T  P  0    34
   E  S  F  J  0   101
   E  S  F  P  0    72

   E  N  T  J  1   3
   E  N  T  P  1   2
   E  N  F  J  1   4
   E  N  F  P  1  15

   E  N  T  J 0    20
   E  N  T  P 0    16
   E  N  F  J 0    27
   E  N  F  P 0    65

   I  S  T  J  1  17
   I  S  T  P  1   3
   I  S  F  J  1   6
   I  S  F  P  1   4

   I  S  T  J 0   123
   I  S  T  P 0    49
   I  S  F  J 0   132
   I  S  F  P 0   102

   I  N  T  J  1   1
   I  N  T  P  1   5
   I  N  F  J  1   1
   I  N  F  P  1   6
   
   I  N  T  J 0    12
   I  N  T  P 0    30
   I  N  F  J 0    30
   I  N  F  P 0    73
;
run;

proc logistic data=drinkData;
title 'proc logistic problem2';
class EI SN TF JP;

model drink(event='1') = EI SN TF JP /;

weight freq;

run;

*/##################################################################;



*/####################################################################################################################;

*/problem3; 

%web_drop_table(WORK.insect);


FILENAME REFFILE '/gpfs/user_home/sergiu/CAT/hw4/Insect Death.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.insect;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.insect; RUN;


%web_open_table(WORK.insect);


proc logistic data=work.insect;
title 'proc logistic problem3a';
class DoseLevel;

model Dead/Total= DoseLevel /Lackfit;


run;


proc logistic data=work.insect;
title 'proc logistic problem3b';
class DoseLevel;

model Dead/Total= Dosemgl /Lackfit;


run;



*/####################################################################################################################;

*/problem4; 

%web_drop_table(WORK.bankLoan);


FILENAME REFFILE '/gpfs/user_home/sergiu/CAT/hw4/Bank Loan Data.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.bankLoan;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.bankLoan; RUN;


%web_open_table(WORK.bankLoan);




proc logistic data=work.bankLoan;
title 'proc logistic problem4';
class y marital jobCategory educationLevel PreviousDefault ownAhouse currentBankCustomer;

model y (event='yes')= age jobCategory marital educationLevel PreviousDefault currentLoanBalance ownAhouse currentBankCustomer /Lackfit;


run;



*/####################################################################################################################;

*/problem5; 

%web_drop_table(WORK.bankLoan);


FILENAME REFFILE '/gpfs/user_home/sergiu/CAT/hw4/NZ Bird Data.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.NZbird;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.NZbird; RUN;


%web_open_table(WORK.NZbird);




proc logistic data=work.NZbird;
title 'proc logistic problem5';
class status Diet;

model status (event='1')= Length Mass Range Diet Clutch Release Broods Individuals /;


run;


