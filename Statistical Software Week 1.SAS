/* 1.direct input */

data test;
input id age region $;
cards;
1 20 서울
2 22 인천광역시
;
run;

/* 2. import data */

data exam2;
infile '/home/u61026661/exam2.txt';
input class id math eng iq1 iq2;
run;

proc print data=exam2;
run;

/* import xlsx file */

proc import out=exam4
datafile='/home/u61026661/exam4.xlsx'
dbms=xlsx
replace;
getnames=yes;
run;

proc print data=exam4;
run;

/* export data */
proc export data=exam2
outfile='/home/u61026661/exam2_export.xlsx'
dbms=xlsx replace;
run;

/* create library */

libname stat '/home/u61026661/swstat';

data stat.exam2;
set exam2;
run;

/* 실습과제 */
data exam1;
input class id name $ gender $ dept $ age reg $;
cards;
1 1 승현 M 통계 20 서울
1 2 경희 F 전산 20 광역
1 3 희영 F 전산 20 서울
1 4 남석 M 전산 20 지방
1 5 주형 M 전산 21 서울
1 6 상철 M 통계 20 지방
1 7 호준 M 통계 20 광역
1 8 선영 F 통계 22 서울
1 9 동준 M 통계 20 지방
1 10 수미 F 전산 20 광역
1 11 정아 F 전산 21 지방
1 12 경기 M 통계 21 지방
1 13 숙희 F 통계 22 서울
1 14 미라 F 전산 20 광역
1 15 철민 M 통계 25 광역
;
run;

data stat.exam1;
set exam1;
run;

proc import out=exam3
datafile='/home/u61026661/swstat/exam3.xlsx'
dbms=xlsx
replace;
getnames=yes;
run;

data stat.exam3;
set exam3;
data stat.exam4;
set exam4;
run;