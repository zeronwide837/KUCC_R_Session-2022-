vec <- c(1,2,3,4,5) #numeric 벡터
seq1 <- 1:5 #integer 벡터
logi <- TRUE #논리값
imag <- 1 + 4i #복소수
x1 <- NULL #numeric(0)
x2 <- NA #결측치
x3 <- NaN #이상치
x4 <- Inf #무한대

#위 자료들은 모두 벡터임

mat <- matrix(1:4,2,2) #행렬
mat2 <- matrix(1:5, ncol=1) #행렬
arr1 <- array(1:27, c(3,3,3)) #배열
arr2 <- array(1:9, c(3,3,1)) #배열
lst <- list(vec,seq1,logi,imag,mat,mat2) #리스트
datf <- data.frame(c(1,2,3),c("a","b","c"),c(T,F,T)) #데이터프레임
fdat <- sample(c("수","우","미"),10, replace = T)
fac <- factor(fdat,levels = c("수","우"),labels=c("A","B"),ordered = FALSE) #인자, "미"는 levels에 지정되지 않았으므로 NA로 반환
fac

library(tidyverse) #데이터 분석용 패키지
library(lubridate) #날짜, 시간 패키지
library(xts) #시계열 데이터 패키지

datt <- c(6,7,4,9,8,5,1)
datt_ts <- as.ts(datt)
datt_ts #시계열

#객체 유형 반환
mode(vec); mode(seq1); mode(lst); mode(datf); mode(mat)
typeof(vec); typeof(seq1); typeof(lst); typeof(datf); typeof(mat)
class(vec);class(seq1);class(lst);class(datf);class(mat)

#자료형 변환
matvec <- as.vector(mat)
class(matvec)

vecmat <- as.matrix(vec)
class(vecmat)

#이상한(?) 값들
##NULL
is.logical(x1)
x1 + 1 #numeric(0)

#Inf
is.logical(x4)
x4 + 1 #Inf
x4 - 1 #Inf
x4 + 2i #Inf + imagine
x4 - x4 #NaN
is.infinite(x4) #TRUE
is.finite(x4) #FALSE

#NaN
0/0
Inf - Inf
is.nan(x3)

#NA
length(x2) #1
x2 + 1 #NA
x2 - 1 #NA
x2 + 5i #NA
x2 + Inf #NA

x5 <- c(1,4,6,NA,8,NA)
is.na(x5)
x6 <- na.omit(x5)
x6