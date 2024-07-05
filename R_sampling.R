help(sample)
p1 <- rnorm(1000, mean=0, sd=1)
qqnorm(p1)
qqline(p1,col="red",lwd=2)

p2 <- rt(1000,5)
qqnorm(p2)
qqline(p2,col="red",lwd=2)

p3 <- runif(1000, 0, 1)
qqnorm(p3)
qqline(p3,col="red",lwd=2)

p4 <- rchisq(1000, 2)
qqnorm(p4)
qqline(p4,col="red",lwd=2)

par(mfrow = c(2,2))
hist(p1)
hist(p2)
hist(p3)
hist(p4)
