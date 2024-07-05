#R 기본기능(변수)
## 변수 생성 및 삭제
a <- 1
a
rm(a)
a

a <- 1; b <- "a"; c <- T
ls()
rm(list=ls())
ls()

a <- 123
a <- NULL
a

rm(list=ls())

#R 기본기능(벡터)
##벡터 생성 방법
v1 <- c(1,2,3,4,5)
v1
class(v1)

v2 <- c("a","b","c","d","e")
v2
class(v2)

v3 <- c(1,2,3,"a","b")
v3
class(v3)

seq1 <- 1:8
seq1
class(seq1)

##변수 이용하기
v4 <- v1
v4

v5 <- c(1:4, 8,6,9,0)
v5
class(v5)
v5[4]
v5[-4]
v5[c(1,3,5)]
v5>5
which(v5>5)
which.min(v5)
which.max(v5)
sum(v5)
sum(v5 <= 5)
sum(v5[v5<=5])

c(v1,v2)
cbind(v1,v4)
rbind(v1,v4)
rbind(v1,v4)[1,2]

v1 | v4
v1 || v4
v1 & v4
v1 && v4
