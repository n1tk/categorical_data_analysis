
data test;

input outcome $ count;

datalines;

yes 344

no 826

;

ods select binomialcls;

proc freq data=test order=data ;

tables outcome / binomial (CL=

ALL

WALD

WILSON


CLOPPERPEARSON

JEFFREYS

AGRESTICOULL


)
alpha=.01
;



weight Count;

run;

ods select binomialcls;


ods select binomialcls;

proc freq data=test order=data ;

tables outcome / binomial (CL=

WALD corrected

WILSON corrected


)
alpha=.01
;



weight Count;

run;

ods select binomialcls;