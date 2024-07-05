#data()은 무슨 함수인가?
data() #global environment에 불러올 수 있는 데이터 목록

install.packages("survival")
install.packages("dislabs")

library(survival)
library(dslabs)
data(package = .packages(all.available = TRUE)) #현재 부착된 패키지에 있는 데이터셋 확인 가능

data(brca) #dslabs 내에 있는 데이터를 global environment에 부착
data(transplant) #survival 내에 있는 데이터를 global environment에 부착


#example()은 어떻게 작동하는가?
example(min()) #잘못된 예
example(min) #옳은 예 함수명만 작성해야 함


#source()은 무엇인가?
source("datamake02.R",echo=FALSE) #실행결과가 콘솔창에 안 나옴
source("datamake02.R",echo=TRUE) #실행결과가 콘솔창에 나옴
