library(dplyr)
install.packages("ggplot2")
library(ggplot2)

##### 그래프 그리기 #####
###1. 파이차트
pie(c(30,55,40)) #기본 파이차트 생성

df<-c(30,55,40) #데이터 만들기
label=c("A사","B사","C사") #데이터 각 값에 라벨 설정
colors=c("red","blue","green") #각 라벨의 채우기 색 설정
pie(df, labels=label, col=colors) #라벨 이름과 색을 지정한 파이차트 그리기

pie(df, labels=label, col=colors, main="회사별 판매량",
    clockwise=TRUE, init.angle=90) #시계방향으로 그림/90도에서 시작

##예제 데이터 Titanic: 선실별 생존인원 파이차트
data(Titanic)
head(Titanic)

df<-as.data.frame(Titanic) #데이터프레임 만들기
df
str(df)
head(df)

df_sur<-df %>% filter(Survived == "Yes") %>% group_by(Class) %>% summarise(sum=sum(Freq)) #선실별 생존인원
df_sur

label=df_sur$Class
colors=c("blue", "green", "yellow", "red")
pie(df_sur$sum, labels=label, main="Titanic Survivor", col=colors, init.angle = 90)

###2. 막대그래프
df<-data.frame(var1=c("A사","B사","C사"), var2=c(4,6,5))
df

install.packages("ggplot2")
library(ggplot2)

ggplot(data=df, aes(x=var1, y=var2))+geom_col()

#크기순 정렬
ggplot(data=df,aes(x=reorder(var1, -var2), y=var2))+geom_col() #내림차순 정렬

#예제 Titanic : 선실별 생존인원 막대그래프
ggplot(data=df_sur,aes(x=Class, y=sum))+geom_col()

#빈도 막대그래프
df<-data.frame(var1=c(1,1,1,2,2,3,3,3,3), var2=c(4,4,5,5,5,5,2,2,2));df
ggplot(data=df,aes(x=var1))+geom_bar()

#예제 다이아몬드 연마등급에 대한 빈도막대그래프
head(diamonds)
ggplot(data=diamonds, aes(x=cut))+geom_bar()

#####3. 히스토그램
ggplot(data=diamonds, aes(x=carat))+geom_histogram()

ggplot(data=diamonds,aes(x=carat))+geom_histogram()+xlim(0,3) #그래프 범위 설정

#####4. 선그래프
df<-data.frame(var1=c(1,2,3,4,5,6), var2=c(10,5,8,6,7,9)); df
ggplot(data=df,aes(x=var1, y=var2))+geom_line()

# diamonds 예제
dia_count<-diamonds %>% group_by(carat) %>% summarise(num=n())
head(dia_count)
dia_count

ggplot(data=dia_count, aes(x=carat, y=num))+geom_line()+xlim(0,4)

#####5. 산점도
df<-data.frame(var1=c(1,1,4,2,2,3,1,2), var2=c(5,6,8,7,5,7,8,5));df
ggplot(data=df, aes(x=var1, y=var2))+geom_point()

#예제 데이터 iris
View(iris)
data(iris)
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width))+geom_point()
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species))+geom_point()

#####6. 상자그림
ggplot(data=iris, aes(x=Species, y=Sepal.Width))+geom_boxplot()
ggplot(data=iris, aes(x=Species, y=Sepal.Width, color=Species))+geom_boxplot()


##### 실습과제 #####
# 1
data(Titanic)
df<-as.data.frame(Titanic)
df_notSur<-df %>% filter(Survived == "No") %>% group_by(Class) %>% summarise(sum=sum(Freq))
pie(df_notSur$sum, labels = df_notSur$Class)

# 2
data(Titanic)
df<-as.data.frame(Titanic)
df_ageSur<-df %>% filter(Survived == "Yes") %>% group_by(Age) %>% summarise(sum=sum(Freq))
color=c("blue","green")
pie(df_ageSur$sum, col=color)

# 3
data(diamonds)
diamonds
cut_mean<-diamonds %>% group_by(cut) %>% summarise(mean_price = mean(price))
ggplot(data=cut_mean,aes(x=cut, y=mean_price))+geom_col()

# 4
ggplot(data=diamonds, aes(x=price))+geom_histogram()

# 5
carat_price<- diamonds %>% group_by(carat) %>% summarise(mean_caratPrice = mean(price))
ggplot(data=carat_price,aes(x=carat, y=mean_caratPrice))+geom_line()

# 6
ggplot(data=diamonds, aes(x=carat, y=price, color=cut))+geom_point()

# 7
ggplot(data=diamonds, aes(x=cut, y=price))+geom_boxplot()
