/* IF~THEN OUTPUT */

data kwang seoul country;
set stat.exam1;
if reg='광역' then output kwang;
if reg='서울' then output seoul;
else output country;
run;
proc print data=kwang; run;
proc print data=seoul; run;
proc print data=country; run;

/* SAS 연산자 */
***** 산술연산자;

data dd;
set stat.class2;
total=math+eng;
average=total/2;
run;

data dd1 (keep=name math eng total average);
set dd;
run;
proc print data=dd1;
run;

***** 비교연산자;
data ee;
set stat.class1;
if iq1<iq2 then effect='YES';
else effect='NO';
run;

data ee1 (keep=name iq1 iq2 effect);
set ee;
run;
proc print data=ee1;
run;

***** 논리연산자;

data ff;
set dd;
m_m=83.2;
e_m=81.55;
a=math>m_m & eng>e_m;
run;

data ff1 (keep=name math eng a);
set ff;
if a=1;
run;

proc print data=ff1;
run;

/* SAS 함수 */
***** 산술함수;
data f2_5;
x1=abs(-3.5); x2=max(1,3,5); x3=min(10,20);
x4=mod(15,4); x5=sign(-3.14); x6=sqrt(49);
run;
proc print dat=f2_5;
run;

***** 절단함수;
data f2_6;
y1=ceil(3.58); y2=floor(-5.4);
y3=int(-1.58); y4=round(132.46, 0.1);
run;

***** 수학함수;
data f2_7;
z1=exp(1); z2=gamma(4);
z3=log(10); z4=log10(100);
run;

***** 삼각함수;
data f2_8;
pi=3.141592654;
w1=cos(pi/3);
w2=sin(pi/3);
w3=tan(pi/3);
run;

***** 표본통계량함수;
data f2_9;
v1=mean(1,2,3,4,5);
v2=sum(1,2,3,4,5);
v3=std(1,2,3,4,5);
run;

/********* 확률분포함수 *********/
********PDF;
data f2_10;
pdf1=pdf('NORMAL', -1,0,1); *f(-1);
pdf2=pdf('NORMAL', 0,0,1);
pdf3=pdf('NORMAL', 1,0,1);
run;

********CDF;
data f2_12;
cdf1=cdf('NORMAL', -1.645,0,1); *P(X<=-1.645);
cdf2=cdf('NORMAL',0,0,1);
cdf3=cdf('NORAML',1.645,0,1);

data f2_13;
cdf1=cdf('NORMAL',-1.645,0,1);
cdf2=cdf('NORMAL',0,0,1);
prob=cdf2-cdf1;
run;

*********QUANTILE;
data f2_14;
qf1=quantile('NORMAL', 0.05,0,1);
qf2=quantile('NORMAL', 0.5,0,1);
qf3=quantile('NORMAL', 0.95,0,1);
run;

data f2_15;
qf1=quantile('T', 0.05,10);
qf2=quantile('T', 0.05,20);
qf3=quantile('T', 0.05,30);
qf4=quantile('T', 0.05,50);
run;

/* 실습과제3 */
*****1;
data final_exam5 (keep=id average grade);
set new_exam5;
if average>=90 then grade='A';
else if average>=80 then grade='B';
else if average>=70 then grade='C';
else if average>=60 then grade='D';
else grade='F';
proc print data=final_exam5;

*****2;
data exam6;
p1=pdf('BINOMIAL',5,0.2,20);
p2=cdf('BINOMIAL',15,0.2,20)-cdf('BINOMIAL',10,0.2,20)+pdf('BINOMIAL', 10,0.2,20);
p3=cdf('NORMAL',70,60,5)-cdf('NORMAL',65,60,5);
p4=quantile('NORMAL', 0.95, 60,5);
proc print data=exam6;