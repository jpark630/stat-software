
## 할당

const_1 <-3
const_1
name<-"김민수"
dept<-"통계학과"

## 데이터연산
#산술연산
a<-5
b<-3

a+b; a-b; a*b; a/b; a%/%b; a%%b; a^b;

#비교연산
x<-10; y<-20
x==y
x<y

#논리연ㄴ산
n<-6; m<-120
(m>=120)|(n>=7)

#수학함수
sqrt(2)
sin(pi)
exp(1)
log(10, base=10)
log(10, base=2)
log(10) #base=e
abs(-3)
factorial(5)
choose(5,2)

##데이터 타입
x1<-c(1,2,3)
class(x1)
x2<-c("a","b","c")
class(x2)
y1<-factor(c(1,2,3))
class(y1)

###데이터 벡터
#c()함수

x<-c(1,2,3,4,5)
x

y<-c("kim",2,3)
y

z<-c(1:5)
z

#seq 함수
x<-seq(1,8,by=2);
x

#rep() 함수
y1<-rep(1,5); y1
y2<-c(1:3)
y3<-rep(y2, each=2); y3
y4<-rep(y2, times=2); y4

#원소 추출
z<-c(1:5)
z[1]
z[5]
z[2:5]
z[-1]
z[-c(1,2)]
###리스트

g1<-c("김민수", "서울", 80)
str(g1)

g2<-list("김민수", "서울", 80)
str(g2)

#원소추출

g3<-list(name="김민수", region="서울", grade=c(80, 90, 95)) #각 원소에 이름 지정

g3[2]
g3["name"] #원소명과 원소값 출력

g3[["name"]] #원소값만 출력
g3$name


##데이터프레임

name<-c("김민수","최하나","공민지")
major<-c("물리학과","통계학과","수학과")
grade<-c(4,3,2)
score<-c(3.7,4.2,3.5)
student<-data.frame(name, major, grade, score)
student

#원소추출

student[2]
student[1,]
student[1,2]
student$score
student[1,2]<-"경영학과"
student[1,2]
