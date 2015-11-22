library(caret)
data(faithful)
head(faithful)
lm1 <- lm(eruptions ~ waiting, faithful)
coef(lm1)[1] + coef(lm1)[2] * 60
sqrt(sum((lm1$fitted-faithful$eruptions)^2))# Calculate RSME on data
plot(faithful$waiting, faithful$eruptions, pch=19, col="blue", xlab="Waiting [mins]", ylab= "Duration")
lines(c(60,60),c(0,200),col = "red",lwd = 5)
lines(faithful$waiting, predict(lm1), col = "blue",lwd=3)
