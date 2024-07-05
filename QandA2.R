##온라인 데이터 읽기
ondat <- read.table("https://www1.aucegypt.edu/faculty/hadi/RABE5/Data5/P005.txt",header=T,fill = T)
ondat

#데이터 저장하기
#.Rdata형식으로 저장하고 불러오기
x <- c(1,2,3,4,5,6)
save(x,file="D:/R/rkrqhs/xpr.Rdata")
rm(x)
load(file="D:/R/rkrqhs/xpr.Rdata")
