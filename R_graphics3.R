###다변수 자료 시각화 추가내용
#산점도 행렬에 히스토그램, 회귀선, 상관계수 추가하기
panel.hist <- function(x,...){
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5) )
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col = "cyan", ...)
} 

panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * r)
} 

panel.lm <- function(x, y, col=par("col"), bg=NA, pch=par("pch"),
                     cex=1, col.smooth="black", ...) {
  points(x, y, pch=pch, col=col, bg=bg, cex=cex)
  abline(stats::lm(y~x), col=col.smooth, ...)
}

dat2 <- subset(Cars93,select=c(Min.Price,Price,Max.Price,MPG.city,MPG.highway))
pairs(dat2,lower.panel = panel.lm,upper.panel=panel.cor,diag.panel=panel.hist)


###ggplot2 패키지 이용해서 그림그리기
#산점도 그리기
qplot(Horsepower,Price,data=Cars93, color=AirBags, size=AirBags)

#facets 함수로 영역분할 산점도 그리기
Cars93$manual <- with(Cars93,ifelse(Man.trans.avail=="No","Manual_Trans_No","Manual_Trans_Yes"))
with(Cars93,qplot(Horsepower,Price,data=Cars93,facets=manual~Origin))

#산점도에 회귀선 추가하기
ggplot(Cars93, aes(x=Horsepower,y=Price))+geom_point(shape=16)+geom_smooth(method=lm) #95%의 신뢰구간도 추가됨
##신뢰구간 없애기
ggplot(Cars93, aes(x=Horsepower,y=Price))+geom_point(shape=16)+geom_smooth(method=lm, se=FALSE)

#smoothing line 산점도
qplot(Horsepower,Price,data=Cars93, geom=c("point","smooth"),color=Origin,main="Price vs Horsepower by Origin",xlab="Horsepower",ylab="price")+theme(plot.title=element_text(hjust=1))

#연속형 변수가 추가된 산점도
ggplot(Cars93, aes(x=Horsepower, y=Price, color=Width))+geom_point(shape=16)+scale_color_gradient(low="yellow",high="red")

ggplot(Cars93, aes(x=Horsepower, y=Price, color=Width))+geom_point(shape=16)+scale_color_gradientn(colors=rainbow(5))

#범주형 변수가 추가된 산점도
library(RColorBrewer)
ggplot(Cars93,aes(x=Horsepower,y=Price,shape=AirBags,color=AirBags))+geom_point(size=3)+scale_shape_manual(values=c(16,17,18))+scale_color_brewer(palette="Dark2")

brewer.pal.info

ggplot(Cars93,aes(x=Horsepower,y=Price,shape=AirBags,color=AirBags))+geom_point(size=3)+scale_shape_manual(values=c(16,17,18))+scale_color_brewer(palette="Dark2")+geom_smooth(method=lm, se=FALSE) #회귀선 추가하기

ggplot(Cars93,aes(x=Horsepower,y=Price,shape=AirBags,color=AirBags))+geom_point(size=3)+scale_shape_manual(values=c(16,17,18))+scale_color_brewer(palette="Dark2")+geom_smooth(method=lm, se=FALSE,fullrange=TRUE) #회귀선 범위 확장하기

###고밀도 자료에 대한 그림
#ggplot2 패키지의 diamonds 데이터 탐색하기
str(diamonds)
summary(diamonds)
head(diamonds)

#상자그림 고밀도 산점도 그리기
ggplot(diamonds, aes(carat,price))+stat_bin2d(bins=25, colour="grey50")
with(diamonds,plot(carat,price))

ggplot(diamonds, aes(carat,price))+stat_bin2d(bins=40,color="grey50")+scale_x_continuous(limits=c(0,6))#자료 좀 더 세밀하게 표현하기

ggplot(diamonds, aes(carat,price))+stat_bin2d(bins=40,color="grey50")+scale_x_continuous(limits=c(0,6))+theme(plot.title=element_text(hjust=0.5))+scale_fill_gradientn(colors=c("yellow","green","blue","red"))+labs(x="Carat",y="Price") #제목 추가, 빈도에 따른 색 설정

#일반 고밀도 산점도 그리기
install.packages("SwissAir")
library(SwissAir)
dim(AirQual)
head(AirQual)
with(AirQual,plot(ad.WS~ad.O3,xlab="03",ylab="WS"))

#Smoothed density 이용하기
with(AirQual, smoothScatter(ad.WS,ad.O3,main="Scatter plot by smootged densities", xlab="03", ylab="WS"))

#고밀도 자료에 대한 육면 상자그림
install.packages("hexbin")
library(hexbin)
with(AirQual, plot(hexbin(ad.O3, ad.WS, xbins=100), main="Hexagonalbinning(bins=100)",xlab="O3",ylab="WS"))

with(AirQual, plot(hexbin(ad.O3,ad.WS,xbins=30),main="Hexagonalbinning(bins=30)", xlab="O3",ylab="WS"))#크기 조정

#이미지 산점도 그리기
install.packages("IDPmisc")
library(IDPmisc)
with(AirQual,iplot(ad.O3,ad.WS,xlab="O3",ylab="WS",main="Image Scatter Plot with \n Color Indicating Density"))

#다변수 고밀도 자료에 대한 이미지 산점도
ipairs(subset(AirQual,select=c(ad.O3,ad.WS,ad.WD))) #변수가 3개 이상일시

#확률밀도함수 그리기
qplot(Fuel.tank.capacity, data=Cars93, geom="density", fill=Origin, alpha=I(.2), main="Fuel tank capacity by Origin",xlab="Fuel tank capacity (US gallons)", ylab="Density")+theme(plot.title=element_text(hjust=0.5))