##1번 문제
str(Cars93)
par(mar=c(5.1,4.1,4.1,2.1))
with(Cars93,plot(Horsepower,RPM,main="Horsepower vs RPM",xlab="Horsepower",ylab="RPM",pch=17))
with(Cars93,abline(lm(RPM~Horsepower),col="red",lwd=2))
with(Cars93,lines(lowess(Horsepower,RPM),col="blue",lwd=2))
legend(230,4500,lty=1,col=c("red","blue"),c("regression","lowess"),lwd=2,bty="o")

##2번 문제
dat2 <- with(Cars93,xtabs(~AirBags+Cylinders))
dat2
mosaic(dat2,gp=shading_max)

##3번 문제
mosaic(~Type+AirBags+Origin, data=Cars93, main = "Cars", shade=TRUE, legend=TRUE)

##4번 문제
dat3 <- subset(Cars93,select=c(EngineSize, Horsepower, RPM, Passengers, Length))
pairs(dat3)

##5번 문제
with(Cars93, plot(EngineSize,Horsepower,xlab="EngineSize",ylab="Horsepower", type="n")) #빈 산점도
with(subset(Cars93,AirBags=="Driver & Passenger"),points(EngineSize,Horsepower,col="red",pch=19)) #Driver & Passenger
with(subset(Cars93,AirBags=="Driver only"),points(EngineSize,Horsepower,col="blue",pch=17)) #Driver only
with(subset(Cars93,AirBags=="None"),points(EngineSize,Horsepower,col="black",pch=8)) #None


fit1 <- with(subset(Cars93,AirBags=="Driver & Passenger"),lm(Horsepower~EngineSize))
fit2 <- with(subset(Cars93,AirBags=="Driver only"),lm(Horsepower~EngineSize))
fit3 <- with(subset(Cars93,AirBags=="None"),lm(Horsepower~EngineSize))

xx1 <- subset(Cars93,AirBags=="Driver & Passenger")$EngineSize
yy1 <- fit1$coef[1]+fit1$coef[2]*xx1

xx2 <- subset(Cars93,AirBags=="Driver only")$EngineSize
yy2 <- fit2$coef[1]+fit2$coef[2]*xx2

xx3 <- subset(Cars93,AirBags=="None")$EngineSize
yy3 <- fit3$coef[1]+fit3$coef[2]*xx3

lines(xx1,yy1,col="red",lwd=2)
lines(xx2,yy2,col="blue",lwd=2)
lines(xx3,yy3,col="black",lwd=2)

##6번문제
par(mfrow=c(2,2))

with(subset(Cars93,AirBags=="Driver & Passenger"),plot(EngineSize,Horsepower,col="red",pch=19, main="Driver & Passenger")) #Driver & Passenger

with(subset(Cars93,AirBags=="Driver only"),plot(EngineSize,Horsepower,col="blue",pch=17, main="Driver only")) #Driver only

with(subset(Cars93,AirBags=="None"),plot(EngineSize,Horsepower,col="black",pch=8, main="None")) #None

par(mfrow=c(1,1))

