# 벡터와 행렬 연산
#(1) 데이터 열벡터
a<-c(1,3,5) # = 사용해도 상관 없음
a

#(2) 데이터 행렬
b=matrix(1:6, nrow=2)
b

d=matrix(1:6, ncol=2)
d

x=c(1,2,3,4,5)
y=c(-1,-2,-3,-4,-5)

x+y
t(x)%*%y
x%*%t(x)
x*y
x*x

#x, y를 하나의 열벡터로 만들기
temp=c(x,y)
temp

#x,y를 합쳐 두 개의 열벡터를 가진 행렬로 만들기
temp1=cbind(x,y)     #column bind
temp1

#x,y를 합쳐 두 개의 행벡터를 가진 행렬로 만들기
temp2=rbind(x,y)     #row bind
temp2

#행렬의 각 성분값 제곱하기
temp1*temp1

#전치행렬(transposed matrix) 구하기
t(temp1)

#역행렬
a1=c(34.74,15.66)
a2=c(15.66,378.60)
s=rbind(a1,a2)
s
library(MASS)
solve(s)

##파일입출력
#파일 저장하기
mydf=c(1,2,3)
write.table(mydf,"/Users/jungwon/학교/2022-1/통계소프트웨어/R/test/mydf.txt",sep = ",",row.names=FALSE)

mydf=c(1,2,3)
write.table(mydf,"/Users/jungwon/학교/2022-1/통계소프트웨어/R/test/mydf.csv",sep = ",",row.names=FALSE)

#파일 불러오기

getwd()
setwd("/Users/jungwon/학교/2022-1/통계소프트웨어/R/test")

z=read.table("/Users/jungwon/학교/2022-1/통계소프트웨어/R/test/mydf.txt",header=TRUE) #txt 파일
z

z1=read.csv("/Users/jungwon/학교/2022-1/통계소프트웨어/R/test/mydf.txt",header=TRUE) #csv 파일
z1

z2=read.table("mydf.txt", header=TRUE)
z2

install.packages("readxl")
library(readxl)

exam1<-read_excel("/Users/jungwon/학교/2022-1/통계소프트웨어/exam1.xlsx",col_names=TRUE)
exam1

attributes(exam1)

View(exam1)

##내장 데이터셋 보기
library(help=datasets)
? trees
data(trees) #불러오기
head(trees,n=8); tail(trees,n=8) #앞뒤 일부만 보기. n이 없을 시에 앞에 6개만
names(trees) #변수명
str(trees) #구조
dim(trees) #자원
summary(trees) #요약

##변수명 변경
#names()
library(MASS)
names(Cars93)
names(Cars93[1:5])
Cars93_subset<-Cars93[,c(1:5)]
names(Cars93_subset)

names(Cars93_subset)<-c("v1","v2","v3","v4","v5")
names(Cars93_subset)

#rename() in"reshape" 패키지
install.packages("reshape")
library(reshape)
Cars93_subset<-rename(Cars93_subset, c(v1="v1_manufacturer",
                                       v2="v2_Model",
                                       v3="v3_Type",
                                       v4="v4_Min.Price",
                                       v5="v5_Price"))
names(Cars93_subset)

#rename() in "dplyr" 패키지
install.packages("dplyr")
library(dplyr)
Cars93_subset2<-Cars93[,c(1:3)]
names(Cars93_subset2)

Cars93_subset3<-rename(Cars93_subset2, New_manufacturer=Manufacturer, New_Model=Model, New_Type=Type)
names(Cars93_subset3)


#파생변수 생성
df<-data.frame(kor=c(50,60,90,70,95), eng=c(75,90,80,75,95),
               math=c(70,80,85,100,95))
df
df$sum<-df$kor+df$eng+df$math
df$avg<-round((df$kor+df$eng+df$math)/3, digits=1)
df$result<-ifelse(df$avg>=70,"Pass","Fail")
df$grade<-ifelse(df$avg>=90,"A", ifelse(df$avg>=80,"B",ifelse(df$avg>=70,"C","F")))
df

##기초함수
#반올림
a=c(-2.456, 3.6789, 5.23445676)
round(a, digits=2)

#문자열 처리함수
k<-c("한국대학","문화대학","청남대학")

substr(k,1,2) #문자열추출
k<-gsub("한국","대한민국",k) #문자열변경
k
paste(k,"교",sep="")
grep("문화",k)

#사용자 정의함수
total<-function(x,y)
{ s<-x+y
return(s)
}
total(10,20)

##제어문
#if~else
num<-50
if(num%%2==0){print("짝수")} else {print("홀수")}

#ifelse()
num<-7
ifelse(num%%2==0,"짝수", "홀수")

#데이터추출
head(cabbages)
cabbages1=cabbages[cabbages$Date=="d16",]
cabbages1

cabbages2=cabbages[cabbages$VitC >= 50,]
cabbages2

cabbages3=cabbages[cabbages$Date=="d16" & cabbages$VitC>=60,]
cabbages3

##반복문
#while()
n=0; sum.sofar=0
while(sum.sofar<=100){
  n=n+1
  sum.sofar=sum.sofar+n
}
print(n); print(sum.sofar)

#repeat()
n=0; sum.sofar=0
repeat{
  n=n+1;
  sum.sofar=sum.sofar+n
  if(sum.sofar>100) break
}
print(n); print(sum.sofar)

install.packages("ggplot2")
library(ggplot2)
