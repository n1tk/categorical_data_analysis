*/problem5; 

%web_drop_table(WORK.bankLoan);


FILENAME REFFILE '/gpfs/user_home/sergiu/CAT/hw4/NZ Bird Data.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.NZbird;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.NZbird; RUN;

proc print data=WORK.NZbird; run;


%web_open_table(WORK.NZbird);


data a; set WORK.NZbird;
log_Mass = log10(Mass);
log_Range = log10(Range);
log_Clutch = log10(Clutch);
log_Release = log10(Release);
run;


PROC CONTENTS DATA=a; RUN;

proc print data=a; run;



proc logistic data=a;
title 'proc logistic problem5HW4';
class status Diet;

model status (event='1')= Mass Clutch Release Individuals / expb lackfit;


run;

data c;
set a;
if nmiss(of _numeric_) > 0 then delete;
run;


proc logistic data=c;
title 'proc logistic problem1 with variables log10 transformed including Release Range Range CLutch and Mass';
class status Diet;

model status (event='1')= log_Mass log_Clutch log_Range Release  Individuals / expb lackfit ;


run;


proc logistic data=c;
title 'proc logistic problem1 with variables log10 transformed including Release CLutch and Mass';
class status Diet;

model status (event='1')= log_Mass log_Clutch Release  Individuals / expb lackfit ;


run;

proc logistic data=c;
title 'proc logistic problem1 with variables log10 transformed including Mass CLutch Range';
class status Diet;

model status (event='1')= log_Mass log_Clutch log_Range  Individuals / expb lackfit ;


run;


proc logistic data=c;
title 'proc logistic problem1 with variables log10 transformed including Mass Clutch Individual';
class status Diet;

model status (event='1')= log_Mass log_Clutch  Individuals / expb lackfit ;


run;


*/############################################################################;

*/problem 2 Cardiac;

%web_drop_table(WORK.Cardiac);


FILENAME REFFILE '/gpfs/user_home/sergiu/CAT/HW5/cardiac rehab participation.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.Cardiac;
	GETNAMES=YES;
RUN;


%web_open_table(WORK.Cardiac);

data Cardiac; set WORK.Cardiac;

run;

proc print data=Cardiac (obs=10); run;




proc logistic data=Cardiac;
title 'proc logistic Cardiac rehabilitation';
class gender mobility participation;
model Participation (event='1')= age gender mobility distance  / expb lackfit ;
run;


proc logistic data=Cardiac;
title 'proc logistic Cardiac rehabilitation with removed gender';
class gender mobility participation;
model Participation (event='1')= age mobility distance  / expb lackfit ;
run;


proc logistic data=Cardiac;
title 'proc logistic Cardiac rehabilitation with interaction terms';
class gender mobility participation;
model Participation (event='1')= age mobility distance age*distance distance*mobility  / expb lackfit ;
run;

proc logistic data=Cardiac;
title 'proc logistic Cardiac rehabilitation with interaction terms and polynomial ';
class gender mobility participation;
model Participation (event='1')= age age*age distance*distance  mobility distance age*distance distance*mobility  / expb lackfit ;
run;




*/############################################################################;

*/problem 3 Grad School;

%web_drop_table(WORK.GradSchool);


FILENAME REFFILE '/gpfs/user_home/sergiu/CAT/HW5/Grad School.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.GradSchool;
	GETNAMES=YES;
RUN;

*/PROC CONTENTS DATA=WORK.GradSchool; */RUN;

%web_open_table(WORK.GradSchool);

data GradSchool; set WORK.GradSchool;

run;

proc print data=GradSchool (obs=10); run;


proc logistic data=GradSchool;
title 'Cumulative logistic regression model for GradSchool ';
class apply pared(ref='0') public/param=reference order=data param=reference ref=last;
model apply(order= data)=pared public gpa/ unequalslopes rsquare aggregate =(pared public gpa ) scale=none;
run;

proc logistic data=GradSchool;
title 'Cumulative logistic regression model for GradSchool ';
class apply pared public/param=reference order=data param=reference ref=first;
model apply(order= data)=pared public gpa/ unequalslopes rsquare scale=none;

run;



*/############################################################################;

*/problem 4 Abortion;


%web_drop_table(WORK.Abortion);


FILENAME REFFILE '/gpfs/user_home/sergiu/CAT/HW5/Abortion Data.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.Abortion;
	GETNAMES=YES;
RUN;




%web_open_table(WORK.Abortion);

data abort; set WORK.Abortion;

run;

proc print data=abort (obs=10); run;



proc logistic data=abort;
title 'Cumulative logistic regression modelfor Abortion Dataset';
freq count;
class attitude religion EducationL/order=data param=reference ref=first;
model attitude(order= data)= year religion EducationL/ unequalslopes aggregate=(year religion EducationL) scale=none;
run;


