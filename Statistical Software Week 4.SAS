/* 확률분포_난수함수 */
data f2_16;
do I=1 to 30;
x=rand('NORMAL',75,5);
output;
end;
run;

proc print data=f2_16;
run;

data f2_17;
call streaminit(12345);
do I=1 to 30;
x=rand('normal',75,5);
output;
end;
run;

proc print data=f2_17;
run;

/* DO ~ END */
***** CASE1;
data new_exam1;
set stat.exam1;
if gender='M' then do;
NEW='MALE';
NEW2='남자';
end;
run;

proc print data=new_exam1;
run;

data new_exam1;
set stat.exam1;
if gender='M' then
NEW='Male';
NEW2='남자';
run;

proc print data=new_exam1;
run;

/* CASE2 */
data test1;
do I=1 to 10 by 1;
RESULT=I+10;
OUTPUT;
END;
run;

data test2;
do I=1 to 10 by 1;
RESULT=1+10;
END;
output;
run;

data tst1;
do I=1 to 10 by 1;
RESULT=I+10;
output;
end;
output;
run;

/* CASE3 */
data test3;
do until(age>=4.5);
age+1;
age2=age*2;
output;
end;
run;

data test4;
do while(age=<5.5);
age+1;
age2=age*2;
output;
end;
run;

/* proc step 1 */
/* PRINT & SORT */
proc print data=stat.class1;
var class name gender reg;
run;

proc sort data=stat.class2 out=fa;
by descending iq1;
run;

proc print data=fa;
var class name iq1;
run;

data stat.class;
set stat.class1 stat.class2;
run;

/* PLOT */
proc plot data=stat.class;
plot eng*math='*'/haxis=60 to 90 by 5 vaxis=60 to 95 by 5;
run;

proc plot data=stat.class1;
plot iq1*(math eng)='*';
run;

proc plot data=stat.class;
plot iq1*eng='o' iq1*math='*'/overlay
haxis=60 to 95 by 5 vaxis=95 to 145 by 5;
run;

/* 4주차 과제 */
***** 과제1;
data exam7;
do I=1 to 50;
u=rand('uniform',3,7);
n=rand('normal',80,3);
output;
end;
run;

*****과제2;
data exam8;
input height weight;
cards;
152 48
156 47
163 54
165 57
166 53
168 55
170 62
172 67
173 72
174 70
176 89
177 76
;
run;
proc sort data=exam8;
by descending weight;
run;
proc plot data=exam8;
plot height*weight='*';
run;

*****과제3;
proc plot data=stat.class2;
plot iq2*eng='o' iq2*math='*'/overlay;
run;
