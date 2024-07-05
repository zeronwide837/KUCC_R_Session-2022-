#리스트 정의
vec <- c(1,8,3)
mat <- matrix(1:9,3,3)
ary <- array(1:8, dim=c(2,2,2))
lst <- list(vec,mat,ary) #리스트 함수로 리스트 생성
lst
lst2 <- list(vec,mat,ary,lst) #리스트 내에 리스트 들어갈 수 있음
lst2

#리스트 속성
length(lst) #리스트 내 자료의 개수
mode(lst)
names(lst)<- c("v1","m1","a1") #리스트 내 자료의 이름
names(lst)
lst

#리스트 생성 및 활용
#인덱싱
class(lst[[2]])
lst$m1
lst[[2]][1,3]
lst[2]

#리스트를 이용하여 배열의 성분에 이름을 부여할 수 있음
dimnames(ary) <- list(c("a","b"),c("c","d"),c("g","h"))
ary

lapply(lst,sum) #list 내 요소들에 함수 sum을 적용하여 연산
class(lapply(lst,sum))

sapply(lst,sum) #결과를 단순화하여 출력
class(sapply(lst,sum))

vapply(lst,sum,double(1)) #결과물의 형태를 지정하여 출력
class(vapply(lst,sum,double(1)))

#리스트 해체
ulst <- unlist(lst)
ulst
