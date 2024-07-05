###레이더 차트 그리기
#레이더 차트용 데이터 만들기
install.packages("doBy") #범주형 변수를 기준으로 양적 변수의 평균을 구할 때 용이
library(doBy)
mean_by_Type2 <- summaryBy(MPG.highway+RPM+Horsepower+Weight+Length+Price~Type,data=Cars93,FUN=c(mean))
mean_by_Type2

df2 <- mean_by_Type2[,c(2:7)]
df_radarchart <- function(df){
  df <- data.frame(df)
  dfmax <- apply(df,2,max)
  dfmin <- apply(df,2,min)
  as.data.frame(rbind(dfmax,dfmin,df))
}
mean_by_Type <- df_radarchart(df2)
row.names(mean_by_Type)<-c("max","min",names(table(Cars93$Type)))
mean_by_Type

#레이더 차트 그리기
install.packages("fmsb")
library(fmsb)
radarchart(df=mean_by_Type,seg=6,pty=16,pcol=1:6,plty=1,plwd=2,title=c("Radar chart by Car Types"))
legend("topleft",legend=mean_by_Type2$Type, col=c(1:6),lty=1,lwd=2)



#오각 레이더 차트 그리기
dat <- Cars93[2:6,c("Price","Horsepower","Turn.circle","Rear.seat.room","Luggage.room")]
datmax <- apply(dat,2,max)
datmin <- apply(dat,2,min)
dat <- rbind(datmax,datmin,dat)
radarchart(dat,seg=5,plty=1,vlabels=c("Price","Horsepower","U-turn space\n(feet)","Rear seat room\n(inches)","Luggage capacity\n(cubic feet)"),title="5 segments, with soecified vabels",vlcex=0.8, pcol=rainbow(5))
legend("topleft",legend=Cars93[2:6,"Make"],col=rainbow(5),lty=1,lwd=1)

###상관관계 그래프
install.packages("magrittr")
install.packages("corrr")
library(MASS)
library(vcd)
library(ggplot2)

#파이프 연산자
library(magrittr)
mtcars %>% head
head(mtcars)

mtcars %>% tan %>% cos %>% sin %>% head %>% round(2)
round(head(sin(cos(tan(mtcars)))),2)

#상관관계 행렬 형태로 표현하기
library(corrr)
mtcars %>% correlate() %>% fashion()
fashion(correlate(mtcars))

mtcars %>% correlate() %>% rplot() #rplot()은 corrr 패키지에 있음

#상관도 네트워크 그림
mtcars %>% correlate() %>% network_plot(min_cor=.3)

#변수 군집 그림
install.packages("Hmisc")
library(Hmisc)
temp <- Cars93[,c("Price","MPG.city","Horsepower","RPM","Length","Wheelbase")]
plot(v <- varclus(~.,data=temp,similarity="spear"))
plot(v <- varclus(~.,data=temp,similarity="pearson"))
p

v <- varclus(~.,data=temp,similarity="pearson")
plot(v)

plot(varclus(~.,data=temp,similarity="pearson"))

plot(varclus(RPM~.,data=temp,similarity="pearson"))

###네트워크 그림 그리기
install.packages("igraph")
library(igraph)
split.screen(figs=c(1,2))
screen(1)
g1 <- graph(edges=c(1,2,2,3,3,1), n=3, directed=F) #undirected network
plot(g1)

screen(2)
g1 <- graph(edges=c(1,2,2,3,3,1), n=3, directed=T) #directed network
plot(g1)

#화살표 방향 바꾸기
screen(1)
g1<-graph(edges=c(2,3, 3,1, 1,2),n=3)
plot(g1,edge.arrow.size=0.5)

#isolated vertex 만들기
screen(2)
g2 <- graph(edges=c(1,2,2,3,3,1),n=7)
plot(g2,edge.arrow.size=0.5)

dev.off()

g3 <- graph(c("Seoul","Busan","Busan","Gwangju","Gwangju","Seoul"))
plot(g3)

g4 <- graph(c("Seoul","Busan","Busan","Gwangju","Gwangju","Seoul","Seoul","Daegu","Seoul","Daejeon"),isolates=c("Sejong","Ulsan"))
plot(g4, edge.arrow.size=1.5, vertex.color="gold",vertex.size=15,vertex.frame.color="gray",vertex.label.color="black",vertex.label.cwx=1.2,vertex.label.dist=2,edge.curved=0.2)

#응용하기
g4 <- graph(c("Seoul","Busan","Busan","Gwangju","Gwangju","Seoul","Seoul","Daegu","Seoul","Daejeon"),isolates=c("Sejong","Ulsan"))
E(g4) #edge 정보 확인 가능
V(g4)
V(g4)$name #vertex 정보 확인 가능

V(g4)$Type <- c("Special","Metropolitan","Metropolitan","Metropolitn","Metropolitan","Multi-functioncal Administrative","Metropolitan")
V(g4)$Pop <- c(9.7,3.4,5.5,2.4,1.5,4.27,2.1)

V(g4)$Type
V(g4)$Pop


E(g4)$traffic_volume <- c(2.8,4.5,8.7,5.64,4.9)
E(g4)$traffic <- c("train","plane","train","highway","highway")
E(g4)$ttype <- c("business","business","business","travel","travel")

E(g4)

plot(g4, edge.arrow.size = 0.5, vertex.label.color="black", vertex.label.dist=2, vertex.color=c("pink",rep("skyblue",4),"peru","skyblue"),edge.curved=0.2) #도시 특성에 따라 vertex 색깔 다르게 하기

plot(g4, edge.arrow.size = 0.5, vertex.label.color="black", vertex.label.dist=2, vertex.color=c("pink",rep("skyblue",4),"peru","skyblue"), edge.curved=c(0.1,0.9,0.3,0.4,0.1)) #edge선마다 curve 다르게 부여하기

plot(g4,edge.arrow.size=0.5, vertex.size=30, vertex.frame.color="gray",vertex.label.color="black", vertex.label.cex=1.2, vertex.label.dist=3.5, edge.curved=0.2, vertex.color=c("pink",rep("skyblue",4),"peru","skyblue")) #vertex 크기 키우고 레이블간 거리 띄우기

(E(g4)$width <- E(g4)$traffic_volume/2) #edge의 굵기가 traffic volume에 비례하도록 설정
plot(g4, edge.arrow.size=0.5, vertex.size=V(g4)$Pop*4, vertex.frame.color="gray",vertex.label.color="black",vertex.label.cex=1.2, vertex.label.dist=3.5, edge.curved=0.2, vertex.color=c("pink",rep("skyblue",4),"peru","skyblue")) #직원수에 따라 vertex 크기 다르게 함

#교통수단에 따라 edge 색깔 다르게 지정하기
te <- c("train","plane","train","highway","highway")
line.col <- ifelse(te=="train",1,ifelse(te=="plane",2,3))
colrs <- c("black","maroon","blue")
plot(g4,edge.arrow.size=0.5, edge.color=colrs[line.col],vertex.size=V(g4)$Pop*4,vertex.frame.color="gray", vertex.label.color="black", vertex.label.cex=1.2, vertex.label.dist=3.5, edge.curved=0.2,vertex.color=c("pink",rep("skyblue",4),"peru","skyblue"))

#범례 추가하기
line.curve <- c(0.1,0.9,0.3,0.4,0.1)
mycolrs <- c("gold",rep("tomato",4),"lightpink","tomato")
plot(g4,edge.arrow.size=0.5,edge.color=colrs[line.col],vertex.size=V(g4)$Pop*6,vertex.frame.color="gray", vertex.label.color="black", vertex.label.cex=1.2, edge.curved=line.curve, vertex.color=mycolrs)

legend("topleft",c("Special","Metropolitan","Metropolitan Autonomous"),pch=21, pt.bg=c("gold","tomato","lightpink"),pt.cex=2, bty="n",ncol=1) #vertex 범례

legend(x=-1.5, y=-1.5, c("train","plane","highway"),lty=1, lwd=2, col=colrs, bty="n",ncol=3) #edge 범례

?igraph.plotting

###외부그림 불러오기와 그림 저장하기
#jpeg 그림 불러오기
install.packages("jpeg")
library(jpeg)
sales.amount <- c(1.5,2.3,5.4,7.5,9,8)

img <- readJPEG("D:/R/rkrqhs/car.jpg")

plot(c(0.5,6.5),c(0,10),axes=F,cex.lab=1.3,type="n",xlab="months",ylab="Sales(in millian dollars)") #빈 플랏

axis(1, at=c(1,2,3,4,5,6),labels = c("January","February","March","April","May","June"),cex.axis=1.2) #x축

axis(2, at=c(0,2,4,6,8,10),labels=c("0","2","4","6","8","10"),cex.axis=1.2) #y축

lines(1:6, sales.amount,lwd=2,col="orange")
for(jj in 1:6){
  rasterImage(img,jj-0.3,sales.amount[jj]-0.3,jj+0.3,sales.amount[jj]+0.3)
} #선 그리고 그림 추가하기

#png 그림 불러오기
install.packages("png")
library(png)

img2 <- readPNG("D:/R/rkrqhs/bitcoin.png")

plot(c(1,6),c(15,46),cex.lab = 1.3, axes=F, type="n",xlab="Engine Size", ylab="MPG in City")
rasterImage(img2,0.7,14.5,6.1,46.0)
axis(1,at=c(1,2,3,4,5,6),labels=c("1","2","3","4","5","6"),cex.axis=1.2)
axis(2,at=seq(15,45,by=5),labels=seq(15,45,by=5),cex.axis=1.2)
with(subset(Cars93,Origin=="non-USA"),points(EngineSize,MPG.city,col=2,pch=16))
with(subset(Cars93,Origin=="USA"),points(EngineSize,MPG.city,col=4,pch=16))
legend("topright",bty="n",c("non-USA","USA"),col=c(2,4),lwd=2,pch=16)
text(2.3,35,pos=4,"Cars in USA have low MPGs in City, \nwhile having large engines ompared \nto non=USA.", col=1)

#그림 저장하기
##jpeg 저장
setwd("D:/R/rkrqhs")
jpeg(file="mpg_engine_size.jpg",width=6,height=6,units="in",res=600,bg="white")
plot(c(1,6),c(15,46),cex.lab=1.3,axes=F,type="n",xlab="Engine Size",ylab="MPG in City")
rasterImage(img2,0.7,14.5,6.1,46.0)
axis(1, at=c(1,2,3,4,5,6),labels=c("1","2","3","4","5","6"),cex.axis=1.2)
axis(2, at=seq(15,45,by=5),labels=seq(15,45,by=5),cex.axis=1.2)
with(subset(Cars93,Origin=="non-USA"),points(EngineSize,MPG.city,col=2,pch=16))
with(subset(Cars93,Origin=="USA"),points(EngineSize,MPG.city,col=4,pch=16))
legend("topright",bty="n",c("non-USA","USA"),col=c(2,4),lwd=2,pch=16)
text(2.3,35,pos=4,"Cars in USA have low MPGs in City, \nwhile having large engines ompared \nto non=USA.", col=1)
dev.off()

##pdf 저장
pdf(file="mpg_engine_size.pdf",width=6,height=6, bg="white",paper="special")
help(pdf)
plot(c(1,6),c(15,46),cex.lab=1.3,axes=F,type="n",xlab="Engine Size",ylab="MPG in City")
rasterImage(img,0.7,14.5,6.1,46.0)
axis(1, at=c(1,2,3,4,5,6),labels=c("1","2","3","4","5","6"),cex.axis=1.2)
axis(2, at=seq(15,45,by=5),labels=seq(15,45,by=5),cex.axis=1.2)
with(subset(Cars93,Origin=="non-USA"),points(EngineSize,MPG.city,col=2,pch=16))
with(subset(Cars93,Origin=="USA"),points(EngineSize,MPG.city,col=4,pch=16))
legend("topright",bty="n",c("non-USA","USA"),col=c(2,4),lwd=2,pch=16)
text(2.3,35,pos=4,"Cars in USA have low MPGs in City, \nwhile having large engines ompared \nto non=USA.", col=1)
dev.off()