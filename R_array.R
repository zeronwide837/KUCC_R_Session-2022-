#배열의 속성
arr1 <- array(1:64, dim = c(4,4,4)) #array 함수로 배열 생성
arr1
length(arr1) #배열 내 자료의 개수
mode(arr1) #배열 내 자료의 형태
dim(arr1) #행, 열, 행렬 개수
dimnames(arr1) #행,열, 행렬의 이름

#배열 생성
x <- c(1:4)
dim(x) <-c(2,2,1) #행 2개, 열 2개, 행렬 1개의 차원 부여
x

#배열의 연산
##인덱싱
arr1[2,,]
arr1[,2,]
arr1[,,2]
arr1[1,2,3]
arr1[-1,-2,-3]
arr1[c(1,3),c(2,4),c(1,4)]
arr1[,,2] + matrix(1:16,4,4)

#배열의 합
arr2 <- array(65:2, dim = c(4,4,4))
arr1 + arr2

#배열의 곱
arr1 * arr2

#배열의 곱의 합
arr1 %*% arr2
