#요인 생성하기
gen <- c("남","여","남","남","여","여","여","남","기타")

gfac <- factor(gen, levels = c("남","여"), labels = c("M","F"), ordered = F, nmax = 5) #기타는 요인에서 제외, 명목형 자료

gfac

class(gfac)
