### Extract the first four columns of the iris dataset and assign it to data_iris

data_iris <-iris[1:4]

### Calculate the covariance matrix of the data

cov_data <- cov(data_iris)

### Calculate the eigenvalues and eigenvectors of the covariance matrix

Eigen_data <- eigen(cov_data)

### Perform Principal Component Analysis (PCA) on the data

pca_data <- princomp(data_iris, cor = 'False')

# Extract the eigenvalues from the Eigen_data object

Eigen_data$values

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Iris_naivebayes/Markdown/01.PNG">

### Extract the loadings (eigenvectors) of the principal components from the PCA result

pca_data$loadings[,1:4]

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Iris_naivebayes/Markdown/02.PNG">

### Extract the eigenvectors from the Eigen_data object

Eigen_data$vectors

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Iris_naivebayes/Markdown/03.PNG">

### Display a summary of the PCA results

summary(pca_data)

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Iris_naivebayes/Markdown/04.PNG">

### Create a biplot for visualizing the relationship between variables and observations in PCA

biplot(pca_data)

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Iris_naivebayes/Markdown/05.PNG">

### Create a scree plot to visualize the proportion of variance explained by each principal component

screeplot(pca_data, type = "lines")

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Iris_naivebayes/Markdown/06.PNG">

### Extract the first principal component scores from the PCA result

model2 = pca_data$loadings[,1]

### Calculate the scores for each observation using the first principal component

model_scores <- as.matrix(data_iris)%*%model2

### Train a Naive Bayes classifier using the original iris data

mod1<- naiveBayes(iris[,1:4],iris[, 5])

### Train a Naive Bayes classifier using the scores from the first principal component

mod2 <-naiveBayes(model_scores,iris[,5])

### Display the confusion matrix for the predictions using the original data

table(predict(mod1,iris[,1:4]),iris[,5])

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Iris_naivebayes/Markdown/07.png">

### Display the confusion matrix for the predictions using the principal component score

table(predict(mod2,model_scores),iris[,5])

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Iris_naivebayes/Markdown/08.PNG">
