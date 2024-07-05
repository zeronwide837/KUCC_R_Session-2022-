#데이터 프레임 생성
datf <- data.frame(c("A","B","C"),c(1,2,3),c(T,F,T)) #데이터 프레임 함수를 이용하여 데이터 프레임 생성
datf
as.data.frame(arr1) #형변환 함수 이용

names(datf) <- c("name","level","gender") #행이나 열에 이름 부여
datf


str(datf) #데이터프레임 내부구조 확인 가능

library(dplyr)
glimpse(datf)

datft <- subset(datf,datf$gender==TRUE) #subset 함수를 이용하여 조건에 맞는 행 추출 가능
datft

setwd("D:/R")

dtest1 <- read.table("dtest1.txt",header=T)
dtest2 <- read.table("dtest2.txt",header=T)
dtest3 <- read.table("dtest3.txt",header=T)
dtest4 <- read.table("dtest4.txt",header=T)

#cbind, rbind 이용하여 데이터프레임 생성 가능
cbind(dtest1,dtest2)
rbind(dtest1,dtest2)
cbind(dtest1,dtest4)
rbind(dtest1,dtest3)

#merge를 이용하여 두 데이터프레임 병합 가능
merge(dtest1,dtest4,by="num",all=T)
merge(dtest1,dtest4,by="num",all=F)
merge(dtest1,dtest4,by="num",all.y=T)
merge(dtest1,dtest4,by="num",all.y=F)

#데이터 프레임에도 apply 함수 사용 가능
apply(dtest1,2,as.character)
