#벡터의 생성
##c()함수 이용하기
v1 <- c(1,2,3,4,5) #numeric
v2 <- c("a","b","c") #character
v3 <- c(T,F,F,T) #logical
v1 ;v2; v3

v1 <- c(1,"a",T) 
class(v1) #character로 형변환
v2 <- c(1,T) #numeric으로 형변환
class(v2)

##수열 만들기
seq1 <- 1:8 #1에서 8까지 증가수열
seq1

seq2 <- seq(1,8,2) #1에서 8까지 증가수열, 공차는 2
seq2

seq3 <- seq(1,8) #공차의 default는 1
seq3

seq4 <- seq(1.1,2.8) #1.1에서 2.8까지 증가수열, 공차를 지정하지 않을 시 두 항만 나옴
seq4

seq5 <- seq(from=1, to=8, length.out=10) #1에서 8까지 길이 10의 증가수열
seq5

seq6 <- seq(from=8, to=1, along.with = seq5) #8에서 1까지 감소수열, 길이는 seq5와 동일
seq6

rep(c(1,2,3),time = 5) #1,2,3을 5번 반복
rep(c(1,2,3),each = 5) #각 각 5번씩 반복

##paste()함수 이용하기
age <- 23
pst <- paste("my age is", age)
pst #문자형 벡터 생성

#벡터 운용
v1 <- c(1,2,3,4,5)
v1[1] #v1의 첫 번째 인자
v1[1]<-8 #v1의 첫 번째 인자를 8로 바꿈
v1
v1[-1] #v1의 첫 번째 인자를 제외하고 출력
v1[which(v1>3)] #3보다 큰 v1의 인자 출력
head(v1,2) #앞 에서 2개의 인자 출력
tail(v1,2) #뒤에서 2개의 인자 출력
v1 <- c(2,4,5,3,1)
v1<3 #각 인자가 3보다 작은지 판별
which(v1<3) #3보다 작은 인자의 인덱스 반환
v1[v1<3] #3보다 작은 인자 반환

seqa <- 1:8
seqb <- c(1,8)
identical(seqa, seqb) #두 벡터가 같은지 판별
seqc <- seq(1,8)
identical(seqa,seqc)
