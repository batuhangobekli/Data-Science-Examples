library(tidyverse)
library(mpg)
#We can classify and draw graphs using ggplot.The end of the box shows the upper and lower quartiles
ggplot(mpg, aes(class, hwy)) +
  geom_boxplot()
#But the data we can analyse is not new and transformed.So I find this website.https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data.?
#This site gives "mpg", "cylinders", "displacement", "horsepower", "weight", "acceleration", "model year", "origin", "car name"
#Imported this way

fileUrl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data"
automobile <- read.table(fileUrl)
names(automobile) <- c("mpg", "cylinders", "displacement", "horsepower", "weight", "acceleration", "model year", "origin", "car name")

#The features will impact the graphic.The graph shows the relationship between mpg with weight
ggplot(automobile, aes(as.integer(weight), mpg)) + geom_point()+geom_smooth()

#The features will impact the graphic.The graph shows the relationship between mpg with displacement
ggplot(automobile, aes(displacement, mpg)) + geom_point()+geom_smooth()

#The features will impact the graphic.The graph shows the relationship between mpg with cylinders
ggplot(automobile, aes(cylinders, mpg)) + geom_point()+geom_smooth()

#The features will impact the graphic.The graph shows the relationship between mpg with horsepower
ggplot(automobile, aes(as.integer(horsepower), mpg)) + geom_point()+geom_smooth()

#Creating correalation will be MPG and weight
automobile.lm3 = lm(mpg ~ weight, data = automobile)
summary(automobile.lm3)
#Correalation of Mpg and weight = 0.69

#The parameters disp and weigh we can create a model to fit our data model.
automobile.lm2 = lm(mpg ~ displacement, data = automobile)
summary(automobile.lm2)
#Correalation of Mpg and disp = 0.65

#->Conclusion The impact of weight,disp have bigger impact on Mpg.