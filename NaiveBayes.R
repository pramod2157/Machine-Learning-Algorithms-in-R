library(e1071)

data <- read.csv("C:\\Users\\coep\\Desktop\\eNSEMBLE\\DATA\\default_credit_card.csv",header = TRUE)
data1<- data
sample1 <- seq(from = 0, to = 500, by = 1)
#sample1 <- sample(nrow(data1), 500)
data<-data1[sample1,]
x_train <- data[,-25]
y_train <- data[,25]
x <- cbind(x_train,y_train)
x$y_train <- as.factor(x$y_train)


naiveBayesModel <- naiveBayes(y_train ~ .,data = x)

summary(naiveBayesModel)

#sample2 <- sample(nrow(data1), 500)
sample2 <- seq(from = 1000, to = 1500, by = 1)
dataTest <- data1[sample2,]
x_test<- dataTest[,-25]
y_test<- dataTest[,25]
fitted.results <- predict(naiveBayesModel,x_test,type = 'class')
#fitted.results <- ifelse(fitted.results > 0.5,1,0)
misClasificError <- mean(fitted.results != y_test)
print(paste('Accuracy',1-misClasificError))
