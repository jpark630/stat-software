/*PROC UNIVARIATE/MEANS/SUMMARY */
/* 기술통계량 & 정규성검정 */

PROC SORT DATA=stat.class out=class_g;
by gender;
run;

proc univariate data=class_g;
by gender;  *by->class;
var iq1;
run;

proc univariate data=stat.class normal plot;
var math eng;
run;

proc means data=stat.class n mean std;
class gender;
var math eng iq1;
run;

proc means data=stat.class n mean std;
 class gender;
 var math;
 output out=class_out N(math)=nn
 					Mean(math)=math_mean
 					std(math)=math_std;
run;

proc print data=class_out;
run;

proc summary data=stat.class mean print;
class gender reg;
var math eng;
output out=class_out1 mean(math eng)=;
run;

proc print data=class_out1;
run;

/* 그래프 작성 */
/* 히스토그램 */
proc univariate data=stat.class;
class gender;
var math;
histogram math/ normal(mu=est sigma=est);
run;

/* 상자그림 */
proc sort data=stat.class out=class_d;
by dept;
run;

proc boxplot data=class_d;
plot eng*dept/ boxstyle=schematic;
run;

/* (수직/수평)막대그래프 */
proc chart data=stat.class;
hbar class/ discrete;
run;

proc chart data=stat.class;
vbar iq1 / midpoints=95 to 145 by 10; *midpoints: 가로축 값 조정, vaxis: 세로축 값 조정

run;

proc gchart data=stat.class;
vbar iq1 / space=0 width=10; *space: 막대사이 간격, width: 막대의 폭;
run;


/* 모평균검정 */
/* 단일모집단의 모평균 검정 */

proc ttest data=stat.class H0=80; *H1: mu>80 (H0:mu<=80)-> p-value=0.206;
var math;
run;

proc univariate data=stat.class MU0=80 ALPHA=0.1 cibasic; *cibasic 없으면 신뢰구간 출력 안 됨;
var math;
run; 

/* 5주차 과제 */
data exam9;
input weight;
cards;
10.21
10.53
9.99
11.11
10.47
10.48
10.25
10.63
11.07
10.61
10.33
10.01
11.20
10.41
10.33
10.12
10.78
10.91
10.37
9.58
;
run;

proc sort data=exam9;
by weight;
run;

proc univariate data=exam9;
var weight;
run;

proc means data=exam9 mean median std skewness kurtosis;
var weight;
run;

proc summary data=exam9 mean median std skewness kurtosis print;
var weight;
run;

data exam10;
input year $ score;
cards;
L 88
L 67
L 77
L 75
L 84
L 90
L 95
L 73
L 69
L 80
L 79
L 82
L 95
L 62
H 82
H 86
H 88
H 92
H 77
H 72
H 96
H 75
H 68
H 96
H 85
H 86
H 76
H 89
H 84
;
run;

proc sort data=exam10;
by year;
run;

proc univariate data=exam10;
by year;
var score;
run;

proc univariate data=exam10;
class year;
var score;
histogram score/ normal(mu=est sigma=est);
run;

proc sort data=exam10 out=exam10_t1;
by year;
run;

proc boxplot data=exam10_t1;
plot score*year/ boxstyle=schematic;
run;

* p값이 0.05 이하이므로 귀무가설을 기각한다. 즉, 정규분포를 따르지 않는다.;

proc summary data=exam10 mean std cv max min print;
class year;
var score;
output out=exam10_t2 mean(score)=;
run;

proc print data=exam10_t2;
run;

proc summary data=exam10 mean;
class year;
var score;
output out=exam11 mean(score)=;
run;