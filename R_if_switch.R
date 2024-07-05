#if 조건문
x <- c(1,2,3,4)
y <- c(2,1,4,5)
if(sum(x)<sum(y)) print(x) #두 벡터 중 합계가 더 작은 벡터 출력하기

##실행문이 길 시 대괄호 사용
if(sum(x)<sum(y)){
  print(mean(x))
  print(var(x))
} #두 벡터 중 합계가 더 작은 벡터의 평균, 분산 출력하기

#if else 조건문
x <- c(1,2,3,4)
y <- c(2,1,4,5)
if(mean(x)>mean(y)) print("Mean(x)>Mean(y)") else print("Mean(x)<Mean(Y)") #평균 크기를 비교하여 어느 벡터의 평균이 더 큰지 문자열로 알려줌

##실행문이 길 시 대괄호 사용
if(mean(x)>mean(y)){
  print(mean(x))
  print(var(x))
} else {
  print(mean(y))
  print(var(y))
} #평균이 더 큰 벡터의 평균, 분산 출력

#중첩 조건문
x <- c(1,2,3,4)
x <- c(2,1,4,5)
if(length(x)==5){
  if(sum(x)==10) print("length=5, sum=10")
}else{
  print("length=4, sum=10")
} #벡터의 length와 sum에 따라 문자열 출력

##if else문도 중첩 가능
if(length(x)==4){
  if(sum(x)==10) print("length=4, sum=10")else
    print("length=5, sum=10")
}

#ifelse 조건문
x<-c(1,2,3,4)
y<-c(2,1,4,5)
ifelse(x<y,x,y) # 둘 중 더 작은 벡터 출력

##중첩조건문 사용 가능
ifelse(sum(x-y)>0, "positive", ifelse(sum(x-y)<0,"negative","zero")) #두 벡터의 차의 합이 양수인지 음수인지 0인지 판별

#switch문
##매개변수가 문자열
x <- c(1,2,3,4)
type <- "var"
switch(type,mean=mean(x),median=median(x),sum=sum(x),var=var(x)) #분산 출력

##매개변수가 정수
switch(1,mean(x),sum(x),var(x)) #첫 번째 실행문(평균) 출력
