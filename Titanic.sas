/*importing the csv file in work directory*/
proc import out=birth.titanic
datafile= '/home/u45030497/sasuser.v94/titanic_train.csv' dbms=csv;
Getnames=yes;
run;
/*Replacing the missing values to some values*/
Data  birth.titanic;
set birth.titanic;
if age=. then
age=20.2;
run;
/*Checking if there is some missing numeric values using Nmiss*/
Proc means data=birth.titanic nmiss;
var age;
run;
/**/
data birth.titanic;
set birth.titanic;
if Embarked='' Then
Embarked='S';
run;
proc print;
run;
/*Frequency table is for the categorical variable which summarizes the data*/
PROC FREQ DATA=birth.titanic;
	TABLE survived / NOCOL NOROW NOPERCENT;
RUN;
proc reg data=birth.titanic;
model survived=pclass age fare parch ;/*(/noint)-suppresses the intercept*/
/*output out=T predicted=py residual=ry;*/
run;


