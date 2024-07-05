#행렬의 속성
M1 <- matrix(1:4,2,2) #행렬 함수 이용하여 행렬 생성
length(M1) #행렬 내 자료의 개수
mode(M1) #행렬 내 자료의 형태
dim(M1) #행, 열 개수
dimnames(M1) #행, 열의 이름

#행렬의 생성
v1 <- c(1,2,3,4,5)
v2 <- c(6,7,8,9,0)
M2 <- cbind(v1,v2) #열 결합
M2

x <- c(9:18)
dim(x) <- c(2,5) #차원(행, 열 개수) 부여
x

rownames(M2) <- c("a","b","C","D","E") #행 이름 부여
colnames(M2) <- c("1","2") #열 이름 부여
M2 

MD <- diag(c(1,2,3,4,5)) #대각행렬 생성
MD
diag(MD) #행렬의 대각열 추출
diag(M1)
diag(M2)

#행렬의 연산
M1[1,2] #1행 2열 인수 추출
M1[1,2] <- 2 #1행 2열 인수를 2로 바꿈
M1
M1[-1,] #1행 제외하고 출력
M2[M2[,2]>7,1] #2열 중 7보다 큰 행, 1열 출력
M2[c(1,3,5),2] #1,3,5행, 2열 출력

M2a<-apply(M2,2,mean) #열의 평균 출력
M2a
M2a2<-sweep(M2,2,colMeans(M2)) #각 열과 열 평균의 차 출력
M2a2
M2a3<-sweep(M2,1,1,"+") #각 행과 1의 합
M2a3

M23 <- matrix(c(1,4,6,5,2,9),2,3) 
M32 <- matrix(c(5,6,4,2,7,1),3,2)
M23 %*% M32 #행렬곱

tM23 <- t(M23) #전치 행렬(행과 열을 바꿈)
tM23
M23

solve(M23) #역행렬, 정방행렬만 역행렬을 구할 수 있음!
M33 <- matrix(c(1:4,8:11,5),3,3)
M33s <- solve(M33)
M33
M33s
M33 %*% M33s #행렬과 역행렬의 행렬곱은 identity matrix
round(M33 %*% M33s,0)

abc <- eigen(M33) #고윳값, 고유벡터 출력 출력
M33 %*% abc$vectors[,1] 
abc$values[1] * abc$vectors[,1]