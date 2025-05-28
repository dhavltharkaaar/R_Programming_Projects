data(iris)
head(iris)
myPrc <- prcomp(iris[,-5], scale = TRUE)
plot(iris$Sepal.Length, iris$Sepal.Width)
plot(scale(iris$Sepal.Length), scale(iris$Sepal.Width))
myPrc
summary(myPrc)
plot(myPrc, type= 'l')
biplot(myPrc, scale = 0)
str(myPrc)
myPrc$x
iris2<-cbind(iris,myPrc$x[,1:2])
head(iris2)
cor(iris[,-5],iris2[,6:7])
