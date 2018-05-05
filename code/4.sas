data ecg;

input intervention $ gender $ hospital $ under_10 $ freq;

datalines;

Pre Female C Yes 10

Pre Male C Yes 27

Pre Female D Yes 10

Pre Male D Yes 23

Pre Female K Yes 25

Pre Male K Yes 96

Pre Female P Yes 3

Pre Male P Yes 9

Post Female C Yes 7

Post Male C Yes 10

Post Female D Yes 6

Post Male D Yes 20

Post Female K Yes 48

Post Male K Yes 89

Post Female P Yes 3

Post Male P Yes 19

Pre Female C No 33

Pre Male C No 53

Pre Female D No 25

Pre Male D No 47

Pre Female K No 58

Pre Male K No 76

Pre Female P No 12

Pre Male P No 13

Post Female C No 35

Post Male C No 62

Post Female D No 29

Post Male D No 33

Post Female K No 40

Post Male K No 66

Post Female P No 6

Post Male P No 14

;

proc logistic data=ecg;

class inter gender hospital;

model under_10 (event='yes')=inter gender hospital/;

weight freq;

run;

data survive;

input nacit glyc time number trials;

datalines;

-1 -1 -1 34 50

1 -1 -1 20 50

-1 1 -1 8 50

1 1 -1 21 50

-1 -1 1 30 50

1 -1 1 20 50

-1 1 1 10 50

1 1 1 25 50

;

proc logistic data = survive;

model number/trials= glyc nacit*glyc;

run;