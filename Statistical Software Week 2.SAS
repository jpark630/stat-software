/* 1. input */
data test;
input a b c d;
cards;
1 2 34 567
;
run;

data test;
input a 1 b 2 c 3-4 d 5-7;
cards;
1234567
;
run;

data test;
input a 1. b 1. c 2. d 3.;
cards;
1234567
;
run;

data test;
input lastnames $ age height weight @@;
cards;
Lee 33 180 80 Kim 40 168 65 Park 25 174 73
;
run;

/* SET */
******1. 자료복사;

data new;
set stat.exam1;

data new1;
set stat.exam2;
iq = iq1 + iq2;
math1 = math + 10;
run;

*****2. 열병합;

data new_exam1;
input class name $ dept $ age height;
cards;
1 민아 통계 20 165
1 성준 수학 22 175
;
run;

data new;
set stat.exam1 new_exam1;
run;

proc print data = new;
run;

/* MERGE */
*****행결합;

proc sort data = stat.exam1; by id; run;
proc sort data = stat.exam2; by id; run;

data stat.class1;
merge stat.exam1 stat.exam2;
by id;
run;

proc print data = stat.class1;
run;

/* KEEP/DROP */

data new1;
set stat.class1;
keep id gender iq1 iq2;
run;

data new2 (keep = id gender iq1 iq2);
set stat.class1;
run;

data new1;
set stat.class1;
drop math iq1 iq2;
run;

data new2 (drop = math iq1 iq2);
set stat.class1;
run;

/* IF */
*****1. IF;

data male;
set stat.exam1;
if gender = 'M';
run;

data female;
set stat.exam1;
if gender ^= 'M';
run;

data test;
set stat.exam1;
if age = 20 or age = 22; *if age in (20,22);
run;

*****2. IF~ Then;

data class1_new;
set stat.class1;
if dept = '통계' then eng = eng + 10;
run;

data test;
set stat.exam1;
if gender = 'M' then delete;
run;

******3. IF~then;* else;

data class_new2;
set stat.class1;
if dept = '통계' then eng = eng + 10; else eng = eng + 5;
run;

data cc;
set stat.class1;
if dept = '통계' then math1 = math + 5; else math1 = math;
run;

data test;
set stat.class1;
if reg = '서울' then region1 = 0;
else if reg = '광역' then region1 = 1;
else region1 = 2;
run;

/* 과제1 */

proc sort data = stat.exam3; by id; run;
proc sort data = stat.exam4; by id; run;

data stat.class2;
merge stat.exam3 stat.exam4;
by id;
run;

data new_class2;
set stat.class2;
ave_iq = (iq1 + iq2)/2;
run;

data new1_class2;
set stat.class2;
if dept = '통계';
run;

/* 과제2 */
data stat.exam5;
input id gender $ mid final ;
cards;
2002001 M 78 88
2002002 F 75 80
2002003 F 86 79
2002004 M 92 88
2002005 M 88 93
2002006 F 67 90
2002007 M 86 77
2002008 M 80 87
2002009 F 95 86
2002010 M 79 90
;
run;

data new_exam5;
set stat.exam5;
total = mid + final;
average = (mid + final)/2 ;
run;
