#키보드를 이용한 자료 입력
sc1 <- scan()
sc1

sc2 <- scan(what="")
sc2

dat1 <- data.frame()
dat1
dat1 <- edit(dat1)
dat1

#외부 파일 자료 읽기
##table 읽기
setwd("C:/Users/CountBall/Desktop/동아리/R")
tbl <- read.table(file = "tabler.txt",header=T)
tbl

tbl2 <- scan(file="tabler.txt", what="")
tbl2

##csv 데이터 읽기
csv1 <- read.csv("OECD.csv",header=T)
csv1
csv2 <- read.csv("Han.csv",header=T, fileEncoding = 'cp949')
csv2

##엑셀 데이터 읽기
library(readxl)
excel1 <- read_excel("excelp.xlsx")
excel1
excel2 <- read_excel("excelp.xlsx", col_names = F)
excel2
excel3 <- read_excel("excelp.xlsx",sheet=2)
excel3

##온라인 데이터 읽기
ondat <- read.table("https://www1.aucegypt.edu/faculty/hadi/RABE5/Data5/P005.txt",header=T,fill=T)
ondat

#데이터 저장하기
#.Rdata형식으로 저장하고 불러오기
x <- c(1,2,3,4,5,6)
save(x,file="D:/R/rkrqhs/xpr.Rdata")
rm(x)
load(file="D:/R/rkrqhs/xpr.Rdata")

##sink 함수 이용하기
sink("C:/Users/CountBall/Desktop/동아리/R/sinkp.txt")
v1 <- c(5:8,1:4,7:11)
mean(v1)
sink()

##cat 함수 이용하기
v1 = c(1,3,5,7,9)
v2 = c(2,4,6,7,10)
v3 = v1 * v2
v4 = v1 + v2
cat("vector v1 = (", v1, ")", "\n", file = "cat1.txt")
cat("vector v2 = (", v2, ")", "\n", file = "cat1.txt", append = T)
cat("v1*v2 = (", v3, ")", "\n", file = "cat1.txt", append = T)
cat("v1+v2 = (", v4, ")", "\n", file = "cat1.txt", append = T)

##txt 파일 저장
x <- c(1,2,3)
x
write(x,"wr1.txt")

x2 <- matrix(1:10,2,5)
x2
write(x2,"wr2.txt")

library(MASS)
x3 <- matrix(1:4, 2, 2)
rownames(x3) = c("a","b")
colnames(x3) = c("s1","s2")
write.matrix(x3,"wr3.txt")
write.table(x3,"wr4.txt")
