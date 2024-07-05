#for 반복문
for (i in 1:5) print(rep(i,i)) #숫자 쌓기

x <- 0
for (i in 1:10) x <- x+i
x #1부터 10까지 합 구하기

#while 반복문
i <- 1
while(i <= 5){
  print(rep(i,i))
  i <- i+1
} #숫자 쌓기 2

i <- 1
x <- 0
while(i <= 10){
  x <- x+i
  i <- i+1
}
x #1부터 10까지 합 구하기2

#repeat 반복문
i <- 1
repeat {
  if(i > 5) break
  print(rep(i,i))
  i <- i+1
} #숫자 쌓기3

i <- 1
x <- 0
repeat {
  if(i > 10) break
  x <- x+i
  i <- i+1
}
x #1부터 10까지 합 구하기 3
