###연속형 자료(이변수)

#산점도
?pch #산점도에 사용할 수 있는 점모양 확인 가능

#산점도 그리기
plot(Cars93$Price,Cars93$MPG.city, main="Price vs MPG in city", xlab="Price", ylab="MPG in city",pch = 19)

with(Cars93, plot(Price, MPG.city, main="Price vs MPG in city", xlab="Price", ylab="MPG in city", pch=19))

with(Cars93, abline(lm(MPG.city~Price), col="red", lwd=2)) #회귀직선

with(Cars93, lines(lowess(Price,MPG.city),col="blue",lwd=2)) #스플라인 회귀선

legend(40,40,lty=1,col=c("red","blue"),c("regression","lowess"),lwd=2,bty="n") #회귀선 범례

help(legend)

###다변수 자료
#명목형 변수 2개
library(vcd)
summary(Arthritis)
art <- xtabs(~Treatment+Improved, data=Arthritis, subset=Sex=="Female")
art

mosaic(art, gp=shading_max) #교차표 검정 파란색은 빈도 많음, 빨간색은 빈도 적음

#명목형 변수 3개 이상
str(Titanic)
levels(Titanic)
mosaic(~Sex+Age+Survived, data=Titanic, main="Survival on the Titanic", shade=TRUE, legend=TRUE)

#다중 산점도
dat1 <- subset(Cars93,select=c(Min.Price, Price, Max.Price, MPG.city, MPG.highway))
pairs(dat1)

#단순 산점도로 보기
with(Cars93, plot(Price,MPG.city, xlab="Price", ylab="MPG in City", main="Mileage"))

#3차원 산점도
library(rgl) #회전 가능
plot3d(Cars93$Price,Cars93$MPG.city,Cars93$MPG.highway)
rglwidget()
rgl.close()

library(scatterplot3d) 
scatterplot3d(Cars93$Price,Cars93$MPG.city,Cars93$MPG.highway)

#그룹별 단순 산점도
with(Cars93, plot(Price,MPG.city,xlab="Price",ylab="MPG in City", type="n")) #빈 산점도
with(subset(Cars93,DriveTrain=="Front"),points(Price,MPG.city,col="orange",pch=19)) #Front
with(subset(Cars93,DriveTrain=="Rear"),points(Price,MPG.city,col="firebrick",pch=17)) #Rear
with(subset(Cars93,DriveTrain=="4WD"),points(Price,MPG.city,col="black",pch=8)) #4WD
legend("topright",legend=c("Front","Rear","4WD"),col=c("orange","firebrick","black"),pch=c(19,17,8),bty="n") #상자 없는 범례

#단순 산점도에 회귀선 추가하기
fit1 <- with(subset(Cars93, DriveTrain=="Front"),lm(MPG.city~Price))
fit2 <- with(subset(Cars93, DriveTrain=="Rear"),lm(MPG.city~Price))
fit3 <- with(subset(Cars93, DriveTrain=="4WD"),lm(MPG.city~Price))

xx1 <- subset(Cars93,DriveTrain=="Front")$Price
yy1 <- fit1$coef[1]+fit1$coef[2]*xx1

xx2 <- subset(Cars93,DriveTrain=="Rear")$Price
yy2 <- fit2$coef[1]+fit2$coef[2]*xx2

xx3 <- subset(Cars93,DriveTrain=="4WD")$Price
yy3 <- fit3$coef[1]+fit3$coef[2]*xx3

lines(xx1,yy1,col="orange",lwd=2)
lines(xx2,yy2,col="firebrick",lwd=2)
lines(xx3,yy3,col="black",lwd=2)

#여러 개의 그림을 동시에 표현하기
par(mfrow=c(2,2))
with(subset(Cars93,DriveTrain=="Front"),plot(Price,MPG.city,col="orange",pch=19,main="Front")) #Front
with(subset(Cars93,DriveTrain=="Rear"),plot(Price,MPG.city,col="firebrick",pch=17,main="Rear")) #Rear
with(subset(Cars93,DriveTrain=="4WD"),plot(Price,MPG.city,col="black",pch=8,main="4WD")) #4WD
par(mfrow=c(1,1))

#나무지도 그림(연속형 변수와 범주형 변수가 동시에 있을 때)
install.packages("treemap")
library(treemap)
data(GNI2014)
head(GNI2014)
treemap(GNI2014, index=c("continent","iso3"),vSize="population",vColor="GNI",type="value") #type에는 vColor에 대응되는 변수의 자료형을 써야 함

treemap(Cars93,index=c("Manufacturer","Make"),vSize="Price",vColor="AirBags",type="categorical")

#풍선 그림
install.packages("gplots")
library(gplots)
dt <- with(Cars93,xtabs(~AirBags+Type)) #명목형 변수 2개 교차표
dt
balloonplot(dt, main="Airbags by Car type", xlab="",ylab="",label=TRUE,show.margins=FALSE) #margin은 행 및 열의 총합 표시 여부 결정, label은 실제값
#각 행과 열에 표시된 회색 음영은 total임

###ggplot2 패키지 활용하기
library(ggplot2)
#상자그림(연속형 단변수+범주형 단변수)
##qplot 함수를 이용해서 그리기
qplot(AirBags, Min.Price, data=Cars93, geom=c("boxplot","jitter"), fill=AirBags, ylab="Minimum Price", xlab="Airbags", alpha=I(.2))

##ggplot함수를 이용해서 그리기
p <- ggplot(Cars93, aes(x=AirBags, y=Min.Price))+ geom_boxplot(aes(fill=AirBags))+scale_fill_viridis_d()
p

ggplot(Cars93, aes(x=AirBags, y=Min.Price))+ geom_boxplot(aes(fill=AirBags))+scale_fill_viridis_d()

##주석 생략하기
p + theme(legend.position="none")+xlab("Airbags")+ylab("Minimum Price")

#그룹별 확률밀도함수(연속형 단변수+범주형 단변수)
ggplot(Cars93, aes(x=MPG.highway))+geom_density(aes(group=Type,colour=Type))+labs(x="MPG.highway",y="Density")+ggtitle("Density of MPG in Highway by Type")+theme(plot.title=element_text(hjust=0.5))

##배경 흰색으로 지정하기
ggplot(Cars93, aes(x=MPG.highway))+theme_bw()+geom_density(aes(group=Type,colour=Type))+labs(x="MPG.highway", y="density")+ggtitle("Density of MPG in Highway by Type")+theme(plot.title=element_text(hjust=0.5))

##동시에 배열하기(ggplot 패키지에선 par(mfrow=c())사용 불가)
p1 <- ggplot(Cars93, aes(x=MPG.highway))+theme_bw()+geom_density(aes(group=Type, color=Type))+labs(x="MPG.highway",y="Density")+ggtitle("Density of MPG in Highway by Type")+theme(plot.title=element_text(hjust=0.5))
p2 <- ggplot(Cars93, aes(x=MPG.highway))+theme_bw()+geom_density(aes(group=Origin, color=Origin))+labs(x="MPG.highway",y="Density")+ggtitle("Density of MPG in Highway by Origin")+theme(plot.title=element_text(hjust=0.5))
library(gridExtra)
grid.arrange(p1,p2,ncol=2)

##4개 배치하기
p1 <- ggplot(Cars93, aes(x=MPG.highway))+theme_bw()+geom_density(aes(group=Type, color=Type))+labs(x=expression("MPG"^highway),y=expression("Density"[value]))+ggtitle("Density of MPG in Highway by Type")+theme(plot.title=element_text(hjust=0.5))+coord_cartesian(xlim=c(25,40))

p2 <- ggplot(Cars93, aes(x=MPG.highway))+theme_bw()+geom_density(aes(group=Origin, color=Origin))+labs(x=expression("MPG"^highway),y=expression("Density"[value]))+ggtitle("Density of MPG in Highway by Origin")+theme(plot.title=element_text(hjust=0.5))+coord_cartesian(xlim=c(25,40))

p3 <- ggplot(Cars93, aes(x=MPG.highway))+theme_bw()+geom_density(aes(group=Man.trans.avail, color=Man.trans.avail))+labs(x=expression("MPG"^highway),y=expression("Density"[value]))+ggtitle("Density of MPG in Highway \n by Manual Transmission Availability")+theme(plot.title=element_text(hjust=0.5))+coord_cartesian(xlim=c(25,40))

p4 <- ggplot(Cars93, aes(x=MPG.highway))+theme_bw()+geom_density(aes(group=AirBags, color=AirBags))+labs(x=expression("MPG"^highway),y=expression("Density"[value]))+ggtitle("Density of MPG in Highway by AirBags")+theme(plot.title=element_text(hjust=0.5))+coord_cartesian(xlim=c(25,40))

grid.arrange(p1,p2,p3,p4,ncol=2,nrow=2)

#그룹별 산점도 그리기(다변수 자료)
qplot(Wheelbase,Width,data=Cars93, shape=Type, color=Type, facets=Origin~AirBags, size=I(2), xlab="Wheelbase",ylab="Car Width")

###graphics 패키지 활용해서 모자이크 그림(다변수 자료) 그리기
#이변수 모자이크
library(graphics)
dt<-with(Cars93,xtabs(~AirBags+Type))
mosaicplot(dt, color=TRUE, las=2, main="Airbags by Car type")

#다변수 모자이크
mosaicplot(~DriveTrain+AirBags+Origin, las=1, main="Drive Train by Airbags and Origin", ylab="Airbag type", xlab="Drive Train", data=Cars93, color=TRUE)
##값 직접 확인하기
with(Cars93,xtabs(~DriveTrain+AirBags+Origin))
