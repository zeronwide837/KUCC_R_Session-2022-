#함수 생성하기
u <- 1 #전역변수
v <- 8 #전역변수

g <- function(x){
  x <- x + 1 #x는 매개변수
  u <- u + x #여기서 u는 지역변수 역할
  return(u)
}

g(v) #g(8) 출력
u #전역 변수는 변화 없음
v #전역 변수는 변화 없음

d.mean <- function(data) { #함수 선언
  sum <- 0
  for (i in 1:length(data)) sum <- sum+data[i] #데이터 매개변수의 원소의 합 구하기
  sum/length(data) #평균 공식
}

x <- rnorm(100, mean=3, sd = 1.5) #평균3, 표준편차 1.5인 정규분포에서 100개의 샘플 추출해서 데이터 생성

d.mean(x) #x의 평균

#fix()함수 사용하여 함수 만들기
fix(d.var) #분산 구하는 함수
d.var(x) #x의 분산

#매개변수를 지정하지 않고 함수 만들기
f0 <- function(){
  x <- c(1,2,3,4)
  y <- c(4,3,2,1)
  z <- x - y
  print(z)
}
f0()

#연산자 생성하기
"%a2b%" <- function(a,b) return(2*a + b) 
3 %a2b% 5 #2*3 + 5 = 11 출력

#함수 내에서 함수 생성하기
f <- function(x) {
  v <- 2 #지역변수 v
  g <- function(y) return((u+v+y)^2) #함수 내에서 함수 정의, u는 전역변수
  gu <- g(u) 
  print(gu)
}

u <- 5
f() #x와 관련된 연산이 없어서 매개변수 입력하지 않고 실행해도 됨

#is.function()
is.function(d.mean) #함수 맞음
is.function(u) #함수 아님

#args()
args(d.mean) #d.mean 은 매개변수로 data 가짐
args(log) #R 내장 함수의 매개변수도 확인 가능

#attributes()
attributes(d.mean) #d.mean 함수의 소스코드 출력
attributes(log)
attributes(mean) #내장함수는 출력 안됨
