## <데이터 전처리 > ##
#####4. 데이터 요약하기
library(dplyr)
empData
empData %>% summarise(mean_workTime=mean(worktime))
empData %>% group_by(department) %>% summarise(mean_workTime=mean(worktime), mean_salary=mean(salary))
empData %>% group_by(position) %>% summarise(empCount=n(),worktimeSum=sum(worktime))

#####5. 데이터 결합하기
##가로결합

df_1<-data.frame(name=c('김준호','이민지','최성준'), year_birth=c(1984, 1989, 1991))
df_2<-data.frame(name=c('김준호','최성준','이지훈'),place_birth=c('서울','인천','대전'))
df_1;df_2

df_inner<-inner_join(df_1, df_2, by='name')
df_inner

df_left<-left_join(df_1,df_2,by='name')
df_left

df_full<-full_join(df_1,df_2,by='name')
df_full

##세로결합
df_a<-data.frame(name=c('김준호','이민지','이지훈','최성준'), year_birth=c(1984,1989,1985,1991))
df_a

df_b<-data.frame(name=c('성수민','오승준','지현우'),year_birth=c(1986,1990,1988))
df_b

df_bindRow<-bind_rows(df_a,df_b)
df_bindRow

####### <데이터 정제> #######
#####1. 결축데이터 처리
data<-data.frame(group=c('A','B',NA,'C','D',NA),prod=c(20,10,50,NA,30,NA))
data

##결축치 확인
table(is.na(data)) #개수 확인
table(is.na(data$group)) #변수별로 확인
table(is.na(data$prod))
sum(data$prod)

##결측치 행 제거
data %>% filter(!is.na(group)) #!is.na(group): data$group is NOT TRUE
data %>% filter(!is.na(group) & !is.na(prod))
na.omit(data) #모든 결측치 삭제

data %>% summarise(m=mean(prod))
data %>% summarise(m=mean(prod, na.rm=T)) #결측치 제거하고 평균 구하기

mean<-mean(data$prod,na.rm=T)
data$prod<-ifelse(is.na(data$prod),mean,data$prod)
data

##(실습예제) 데이터 airquality
data("airquality")
table(is.na(airquality$Ozone))
airquality %>% summarise(mean_Ozone=mean(airquality$Ozone,na.rm=T)) #결측치 제거하고 평균 구하기

airquality$Ozone<-ifelse(is.na(airquality$Ozone),42,airquality$Ozone) #결측치 대체하기

table(is.na(airquality$Ozone))

airquality %>% summarise(mean_ozone=mean(airquality$Ozone))

#####2. 이상 데이터 찾기
##이상치 찾기

data<-data.frame(gen=c(2,1,2,1,3,2,1),grade=c('A','B','B','D','A','B','B'))
table(data$gen)
table(data$grade)

data<-c(0,4,5,6,6,6,7,7,7,10,14,15)
boxplot(data) #상자그림
quantile(data) #사분위수
boxplot(data)$stat #이상치 제외한 5가지 기술통계량(최소, Q1, Q2(중앙), Q3, 최대) 사분위수

##이상치 제거
data<-ifelse(data<4|data>10, NA, data)
data
mean(data, na.rm=T)

##(실습예제) 데이터 airquality
table(is.na(airquality$Wind))
boxplot(airquality$Wind)
boxplot(airquality$Wind)$stat

airquality$Wind<-ifelse(airquality$Wind>16.6,NA,airquality$Wind)
table(is.na(airquality$Wind))

airquality %>% summarise(mean_wind=mean(airquality$Wind,na.rm=T))

##### 과제
data("mtcars")
mtcars %>% group_by(am) %>% summarise(mean_mpg=mean(mpg), mean_disp=mean(disp))
mtcars %>% group_by(cyl) %>% summarise(carCount=n())

df_a<-data.frame(name=c('김준호','이민지','이지훈','최성준'), year_birth=c(1984, 1989,1985, 1991))
df_ex1<-data.frame(name=c('이민지','이지훈','정보라','최성준'), gender=c('여','남','여','남'))
library(dplyr)
inner_df<-inner_join(df_a,df_ex1,by='name')
inner_df

left_df<-left_join(df_a,df_ex1,by='name')
left_df

full_df<-full_join(df_a,df_ex1,by='name')
full_df

df_ex2<-data.frame(name=c('박선우','정한별','조규민'), gender=c('남','남','여'))
row_df<-bind_rows(df_ex1,df_ex2)
row_df

data('airquality')
table(is.na(airquality$Solar.R))
mean_solar=mean(airquality$Solar.R,na.rm=T)
airquality %>% summarise(mean_solar)
airquality$Solar.R<-ifelse(is.na(airquality$Solar.R),mean_solar,airquality$Solar.R)
airquality %>% summarise(m=mean(Solar.R))
boxplot(airquality$Ozone)
boxplot(airquality$Ozone)$stat
#122.0 초과인 값이 이상치이다.
airquality$Ozone<-ifelse(airquality$Ozone>122.0, NA, airquality$Ozone)
mean(airquality$Ozone, na.rm=T)
