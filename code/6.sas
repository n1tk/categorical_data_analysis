*/code problem 1;
%web_drop_table(WORK.horse);


FILENAME REFFILE '/gpfs/user_home/sergiu/CAT/HW6/HorseKick Data.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.horse;
	GETNAMES=YES;
RUN;


%web_open_table(WORK.horse);


*/Poisson Regression;

proc transpose data=work.horse out=horsev1(rename=(col1=y _NAME_=corps));
by year;
var GC C1 C2 C3	C4	C5	C6	C7	C8	C9	C10	C11	C14	C15;

run;

proc means data = horsev1 mean var std;
  var y;
run;

proc genmod data=horsev1  order=data;
title'Problem 1 Poisson regression because mean and variance is different';
class year corps; 
model  y=year corps/ dist=poisson type3;
run;

proc genmod data=horsev1  order=data;
title'Problem 1 negative binomial because mean and variance is different';
class year corps; 
model  y=year corps/ dist=negbin type3 ;
run; 






*/code problem 2;
%web_drop_table(WORK.dermatology);


FILENAME REFFILE '/gpfs/user_home/sergiu/CAT/HW6/Dermatolgy Wait Time.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.dermatology;
	GETNAMES=YES;
RUN;


%web_open_table(WORK.dermatology);

*/Gamma Regression;
proc genmod data=work.dermatology;
title'Problem 2. For this type of the dataset will use Gamma regression. Event occurs  times in unit (1) interval ';
class City (param=ref) Year (param=ref);
model TimetoAppt=City  Year  MedicaidPct  MedicarePct/ dist=gamma link=log type3 ;

run;


*/Gamma Regression;
proc genmod data=work.dermatology;
title'Problem 2. Medicaid removed because is not significant for our model. ';
class City (param=ref) Year (param=ref);
model TimetoAppt=City  Year  MedicarePct/ dist=gamma link=log type3 ;

run;







*/code problem 3, need to double check the model because the p-value is significant ;
%web_drop_table(WORK.bio);


FILENAME REFFILE '/gpfs/user_home/sergiu/CAT/HW6/Biochemists Articles.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.bio;
	GETNAMES=YES;
RUN;

*/PROC CONTENTS DATA=WORK.bio; */RUN;


%web_open_table(WORK.bio);

proc means data = WORK.bio mean var;
  var Articles;
run;

proc genmod data=WORK.bio;
title 'Problem 3. Is count response so we use Negative Binomial Regression because mean is different than variance. proc genmod Negative Binomial  regression with all variables';
  class Gender Married (param=ref ref=first);
  model Articles=Gender Married Children_under5 Prestige_of_PhD Mentor_Articles / type3 dist=negbin;
run;


proc genmod data=WORK.bio;
title 'Problem 3. Is count response so we use Negative Binomial Regression because mean is different than variance. proc genmod Negative Binomial  regression without Married and Prestige_of_PhD variables';
  class Gender (param=ref ref=first);
  model Articles=Gender Children_under5 Mentor_Articles /type3 dist=negbin;
run;


data pvalue;
  df = 199; chisq = 287.0591;
  pvalue = 1 - probchi(chisq, df);
run;
proc print data = pvalue;
run;
