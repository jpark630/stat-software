### 9주차 실습 ###
## 1. 데이터 추출하기
install.packages("readxl")
library(readxl)
install.packages("dplyr")
library(dplyr)
getwd()

empData<-read_excel("/Users/jungwon_park/Downloads/empData.xlsx",col_names=TRUE)
empData

empData %>% filter(department=="영업부")
empData %>% filter(position=="과장")
empData %>% filter(department=="영업부" & position=="과장")

select<-dplyr::select #MASS 패키지의 select()함수와 충돌하는 경우, dplyr 패키지의 함수로 명시적 지정

empData %>% select(name) #한 개의 기준변수
empData %>% select(department)

empData %>% select(name, department) #두 개의 기준변수
empData %>% select(name, salary, worktime)

empData %>% filter(department=="영업부") %>% select(name, worktime) #두 한수 조합하기
empData %>% filter(department=="홍보부") %>% select(name, salary)

#####2. 데이터 정렬하기
empData %>% arrange(name) #한 개의 기준변수
empData %>% arrange(department, position) %>% head() #두 개의 기준변수
empData %>% select(name, salary) %>% arrange(desc(salary))

##### 3. 데이터 변경하기 (파행변수 생성)
empData %>% mutate(bonus=salary*0.1) %>% head()
empData %>% mutate(timeCheck=ifelse(worktime>=40, "over","normal")) %>% head()

new_empData<-empData %>% mutate(bonus=salary*0.1) %>% head()
new_empData
new_empData %>% mutate(timecheck=ifelse(worktime>=40, "over", "normal")) %>% head()
new_empData

new_empData<-empData %>% mutate(bonus=salary*0.1, timecheck=ifelse(worktime>=40, "over", "normal")) %>% head()
new_empData

#####실습 데이터 : mtcars
data(mtcars) #자동차 모형 32종의 성능측정 및 연비와 관련된 데이터셋
mtcars
dim(mtcars) #데이터자원
View(mtcars)

mtcars %>% filter(cyl==6)
mtcars %>% filter(cyl==4 & mpg > 25)
mtcars %>% filter(am==0) %>% select(mpg, cyl, disp)
mtcars %>% arrange(desc(mpg)) %>% head()
mtcars %>% arrange(cyl, desc(mpg))
mtcars %>% mutate(year=1974)
mtcars %>% mutate(trans=ifelse(am==0,"automatic","manual"))
