#1a번 문제
a <- numeric(12)
a[1] <- 1
a[2] <- 1

for (i in 3:12){
  a[i] <- a[i-1]+a[i-2]
}

dim(a) <- c(2,2,3)


#2a번 문제
library(ggplot2)
library(MASS)
table(is.na(survey$Wr.Hnd))
survey2 <- na.omit(survey)
table(is.na(survey2))

with(survey2,qplot(Wr.Hnd,NW.Hnd,data=survey2,facets=W.Hnd~Sex))


#1b번 문제
b1 <- 1:5
b2 <- c("선형대수학","해석학","미분방정식","정수론","이산수학")
set.seed(1)
b3 <- sample(c("A","B","C"),5,replace=T)
b3 <- as.factor(b3)
b <- data.frame(b1,b2,b3)
names(b) <- c("인덱스","과목","학점")
b

#2b번 문제
library(ggplot2)
View(diamonds)
diamonds2 <- as.data.frame(diamonds)
View(diamonds2)
a <- subset(diamonds2,select=c(carat,depth,table))
library(IDPmisc)
ipairs(a)

#1c번 문제
c1 <- list(c("A","B","C","D"),seq(1,100,length.out=10),c(T,F))
c1

c1[[2]][c(2,5)]

c3 <- data.frame(c1[[1]],c1[[2]][c(1,2,5,8)],c1[[3]][c(1,1,1,2)])
names(c3) <- c("name","number","attendance")
c3

#2c번 문제
library(ggplot2)
library(MASS)
qplot(Group,Holders,data=Insurance,geom=c("boxplot","jitter"),fill=Group,xlab="Group",ylab="Holders",alpha=I(.5))

library(yarrr)
par(mfrow=c(1,1))
pirateplot(Holders~Group,point.o=0.5,data=Insurance,main="Holders by Group",inf.method="iqr")

#3번 문제
gr1 <- graph(c("Front","Back","Back","Mine","Mine","Front","Mine","Analysis","Front","Design","AD","Tac","Tac","AD"),isolates=c("HR","Fin"))
V(gr1)
V(gr1)$Type <- c("Develope","Develope","Data","Data","Art","Strategy","Strategy","Manage","Manage")
V(gr1)$Num <- c(23,27,20,10,10,7,8,5,5)

E(gr1)
E(gr1)$dispatch_volume <- c(3,5,2,2,4,1,1)
E(gr1)$dispatch <- c("move","work","work","move","work","work","move")

set.seed(1)

(E(gr1)$width <- E(gr1)$dispatch_volume)

te <- c("move","work","work","move","work","work","move")

line.col <- ifelse(te=="move",1,2)

colrs <- c("black","maroon")

line.curve <- c(0.1,0.9,0.2,0.8,0.7,0.3,0.6)

mycolrs <- c(rep("red",2),rep("blue",2),"pink",rep("green",2),rep("yellow",2))

plot(gr1,edge.arrow.size=1,edge.color=colrs[line.col],vertex.size=V(gr1)$Num*1.5,vertex.frame.color="gold",vertex.label.color="black",vertex.label.dist=3.5,vertex.label.cex=1.2,edge.curved=line.curve, vertex.color=mycolrs)

legend("topleft",c("Develope","Data","Art","Strategy","Manage"),pch=21,pt.bg=c("red","blue","pink","green","yellow"),pt.cex=2,bty="n",ncol=1)

legend(x=-0.5, y=-1.5, c("move","work"),lty=1, lwd=2, col=colrs, bty="n",ncol=2) #edge 범례
