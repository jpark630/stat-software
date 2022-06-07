library(dplyr)
rand<-rnorm(20, mean=3, sd=5)
rand
mean(rand)
sd(rand)
hist(rand)

qnorm(0.4, mean=10, sd=3, lower.tail = FALSE)
pnorm(12, mean=10, sd=3, lower.tail = FALSE)
pnorm(11.5, mean=10, sd=3, lower.tail = TRUE) - pnorm(-11.5, mean=10, sd=3, lower.tail = TRUE)

1 - dbinom(2, size=5, p=1/6)

1-ppois(2, lambda=3)
ppois(3, lambda = 3)
ppois(7, lambda=3)-ppois(1,lambda = 3)

q6_data<-c(1.5, 2.2, 0.9, 1.3, 2.0, 1.2, 2.5, 2.7, 1.8, 2.3)
mean(q6_data)
sd(q6_data)
hist(q6_data)
qqnorm(q6_data)
qqline(q6_data)
shapiro.test(q6_data)

dbinom(0, 5, 0.67)
dbinom(1, 5, 0.67)
dbinom(2, 5, 0.67)
dbinom(3, 5, 0.6666667)
