install.packages("ggplot2")
library(ggplot2)
scatter <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.width))
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species, shape = Species)) +geom_point() + theme_bw() + labs(x = "Sepal Length", y = "Sepal Width", title = "Sepal length vs Width")

scatter <- ggplot(data = iris, aes(x = Petal.Length, y = Petal.width))
ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, color = Species, shape = Species)) +geom_point() + theme_bw() + labs(x = "Petal Length", y = "Petal Width", title = "Petal length vs Width")

# Density plot
ggplot(data = iris, aes(x = Sepal.Length, fill = Species)) + geom_density(alpha = 0.25) +  theme_bw() + labs(x = "Sepal Length", title = "Species vs Sepal Length")
ggplot(data = iris, aes(x = Sepal.Width, fill = Species)) + geom_density(alpha = 0.25) +  theme_bw() + labs(x = "Sepal Width", title = "Species vs Sepal Width")
ggplot(data = iris, aes(x = Petal.Length, fill = Species)) + geom_density(alpha = 0.25) +  theme_bw() + labs(x = "Petal Length", title = "Species vs Petal Length")
ggplot(data = iris, aes(x = Petal.Width, fill = Species)) + geom_density(alpha = 0.25) +  theme_bw() + labs(x = "Petal Width", title = "Species vs Petal Width")

vol <- ggplot(data=iris, aes(x = Sepal.Length))
vol + geom_density(aes(ymax = ..density.., ymin = -..density.., fill = Species, color = Species),  geom = "ribbon", position = "identity") +  facet_grid(. ~ Species) +  coord_flip() +  theme_bw() +  labs(x = "Sepal Length", title = "Species vs Sepal Length")

vol <- ggplot(data=iris, aes(x = Sepal.Width))
vol + geom_density(aes(ymax = ..density.., ymin = -..density.., fill = Species, color = Species),  geom = "ribbon", position = "identity") +  facet_grid(. ~ Species) +  coord_flip() +  theme_bw() +  labs(x = "Sepal Width", title = "Species vs Sepal Width")

irisData <- iris[, 1:4]
totalwSS <- numeric(15)

for (i in 1:15) {
  clusteriris <- kmeans(irisData, centers = i) 
  totalwSS[i] <- clusteriris$tot.withinss
}

plot(x = 1:15, y = totalwSS, type = "b", xlab ="Number of Clusters", ylab = "Within groups sum-of-squares")


install.packages("NbClust")
library("NbClust")
par(mar = c(2,2,2,2))
nb <- NbClust(irisData, method = "kmeans")

hist(nb$Best.nc[1,], breaks =  15, main = "Histogram for Number of Clusters")


install.packages("vegan")
library("vegan")
modeldata <- cascadeKM(irisData, 1, 10, iter =100)
plot(modeldata, sortg = TRUE)


modeldata$results[2,]
which.max(modeldata$results[2,])


install.packages("factoextra")
install.packages("clustertend")
library("factoextra")
library("clustertend")
install.packages("hopkins")
library("hopkins")

genx <- function(x) { runif(length(x), min(x), max(x)) }
random_df <- as.data.frame(apply(iris[, -5], 2, genx))
iris[, -5] <- scale(iris[, -5])
random_df <- scale(random_df)
res <- get_clust_tendency(iris[, -5], n = nrow(iris) - 1, graph = FALSE)
res$hopkins_stat
hopkins(iris[, -5])
res <- get_clust_tendency(random_df, n = nrow(random_df) - 1, graph = FALSE)
res$hopkins_stat
