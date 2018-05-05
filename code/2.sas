*//problem 2.17 Example; 
data startrek;

input status $ color $ count; datalines;


yes yes 189

yes no 10845

no yes 104

no no 10933
;

proc freq data=startrek;

tables status*color / chisq expected cellchi2; weight count;

run;

*/To get the standardized residuals:;
proc freq data=startrek;

tables status*color / crosslist (stdres); weight count;

run;


data colds;

input twelve $ fourteen $ count;

datalines;

yes yes 6

yes no 25

no yes 10

no no 9

;

proc freq data=colds order=data;

weight count;

tables twelve*fourteen /agree;

run;