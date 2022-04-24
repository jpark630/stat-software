/* 독립표본에 대한 모평균 차의 검정 */
*성별 수학점수에 차이가 있는지 검정;
proc ttest data=stat.class;
class gender;
var math;
run;

/* 짝표본에 대한 모평균 차의 검정 */
*프로그램 연수 전후의 지능지수 차이가 있는지 검정;

proc ttest data=sta.class;
paired ip1*ip2;
run;

/* 6주차 과제 */

data exam6_1;
input diameter;
cards;
12.5 12.6 12.4 12.4 12.6 12.8 12.3 12.6 12.4 12.5
12.8 12.5 12.4 12.6 12.7 12.5 12.4 12.5 12.3 12.6
12.6 12.4 12.7 12.5 12.5 12.6 12.5 12.7 12.4 12.6
;
run;

proc ttest data=exam6_1;
var diameter;
run;

/* P값이 0.05 이하이므로 귀무가설을 기각한다. 즉, 부품의 평균지름이 납품서와 같다 */

data exam6_2;
input before after;
cards;
50 48
45 45
55 50
60 60
63 60
48 50
50 49
70 60
56 55
44 48
;
run;

proc ttest data=exam6_2;
paired before*after;
run;

/* p값이 0.05 이상이므로 귀무가설을 채택한다. 즉, 이 다이어트 식품이 체중을 감소시키는 효과가 있다 */
