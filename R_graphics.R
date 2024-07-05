library(MASS)
data(package = .packages(all.available = TRUE))
head(Cars93)
###범주형 단변수 자료

#도수분포표 그리기
##with 미사용
tab <- table(Cars93$Type)
##with 사용
tab <- with(Cars93, table(Type))
tab
class(tab)
mode(tab)
typeof(tab)

#막대그래프 그리기
barplot(tab, main = "Type of Car", xlab = "Type", ylab = "Number of Car", col = 1:6, legend = c("Compact","Large","Midsize","Small","Sporty","Van"))

barplot(tab)

##side형
tab <- with(Cars93, xtabs(~Type+AirBags))
tab
barplot(tab, col=rainbow(6), legend = c("Compact","Large","Midsize","Small","Sporty","Van"),xlab="Airbags",ylab="Number of Cars", beside=TRUE)

##범례 가림 방지
barplot(tab, col=rainbow(6), legend = c("Compact","Large","Midsize","Small","Sporty","Van"),xlim = c(0,ncol(tab)+30),xlab="Airbags",ylab="Number of Cars", args.legend=list(x=ncol(tab)+30,bty="n"),beside=TRUE)

##stacked
barplot(tab, col=rainbow(6),legend = c("Compact","Large","Midsize","Small","Sporty","Van"),xlab="Airbags",ylab="Number of Cars", beside=FALSE)

##범례 가림 방지
barplot(tab, col=rainbow(6), legend = c("Compact","Large","Midsize","Small","Sporty","Van"),xlim=c(0, ncol(tab)+2),xlab="Airbags",ylab="Number of Cars", args.legend=list(x=ncol(tab)+2,y=max(colSums(tab)),bty="n"))

#파이차트
tab <- with(Cars93, table(Type))
pie(tab, col = topo.colors(6))

##문자 바꾸기
names(tab) <- c("COMPACT","LARGE","MIDESIZE","SMALL","SPORTY","VAN")
pie(tab, col = topo.colors(6))

###연속형 단변수 자료
#히스토그램
hist(Cars93$MPG.highway, main = "MPG in Highway", xlab = "MPG in Highway")

with(Cars93, hist(MPG.highway,xlab="MPG in Highway", main="MPG in Highway"))

#확률밀도함수
install.packages("vcd")
library(vcd)
summary(Arthritis)
head(Arthritis)

density(Arthritis$Age)
plot(density(Arthritis$Age))
with(Arthritis,plot(density(Age)))

##히스토그램과 확률밀도함수 겹치기
with(Cars93, hist(MPG.highway, xlab = "MPG in Highway", main = "MPG in Highway", probability=T))
with(Cars93, lines(density(MPG.highway),col='red',lwd=2))

colors()

#Q-Q plot
with(Cars93, qqnorm(Turn.circle, main="Q-Q plot of Turn.circle \n (U-turn space, feet)"))
with(Cars93, qqline(Turn.circle,col="orange",lwd=2))


###연속형 자료 + 이산형 자료
#box plot
boxplot(Min.Price~AirBags, data=Cars93)
boxplot(Min.Price~AirBags, data=Cars93)[]

##box plot 색 수정하기
boxplot(Min.Price~AirBags, data=Cars93, names=c("Driver & Passenger"," Driver only", "None"), col=c("orange","cyan","yellow"), ylab="Minimum Price", xlab="Airbag", ylim=c(0,50),boxwex = 0.25)

##box plot 순서조정
boxplot(Min.Price~AirBags, at=c(3,2,1),data=Cars93, names=c("Driver & Passenger", "Driver only", "None"), col=c("orange","cyan","yellow"), ylab="Minimum Price", xlab="Airbag", ylim = c(0,50), boxwex = 0.25)

#pirate 그림
install.packages("yarrr")
library(yarrr)

pirateplot(formula=Price~AirBags, point.o=0.8, data=Cars93, main="Price by AirBag type",inf.method="iqr")

##명목변수 조합별로 pirate그림 그리기
pirateplot(formula = MPG.city~Origin+DriveTrain, point.o=0.5, data=Cars93, main="City MPG by Origin and Drive Train", inf.method="iqr")

#호흡곡선 그림
library(vcd)
spine(Improved~Age, data=Arthritis, breaks=3)
View(Arthritis)

##4분위수로 나누기
with(Arthritis, spine(Improved~Age, breaks = quantile(Age)))

##자료의 빈도에 따라 나누기
spine(Improved~Age, data=Arthritis, breaks="scott")

#조건부 밀도함수 그림
cdplot(Improved~Age, data=Arthritis)

##연속형 변수 표시
with(Arthritis,rug(jitter(Age),col="white", quiet=TRUE))
