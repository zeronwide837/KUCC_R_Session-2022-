#break 분기문
x <- 0
for (i in 1:10){
  x <- x+i
  if(x > 25) break
  print(x)
} #반복이 아직 안 끝났으나 조건을 충족하여 실행문 중지

for (i in 1:9){
  if(i > 3) break
  for (j in 1:9) {
    if(j > 1) break
    cat(i, "*", j, "=", i*j, "\n" )
  }
} 

##break를 사용할 위치를 정확히 제시해야 함
for (i in 1:9){
  for (j in 1:9) {
    if(j > 1) break
    cat(i, "*", j, "=", i*j, "\n" )
  }
}

for (i in 1:9){
  if(i > 3) break
  for (j in 1:9) {
    cat(i, "*", j, "=", i*j, "\n" )
  }
}

#next 분기문
i <- 1
x <- 0
while(i < 10){
  i <- i+1
  if(i < 8) next
  print(i)
  x <- x+i
} #i가 8보다 작을 땐 실행을 건너뜀
