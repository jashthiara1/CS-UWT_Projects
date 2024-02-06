##########
# Jasharn Thiara
# TMATH 410, WINTER 2023
# RIntro1
# Jan 8, 2023
##########
#------------------
# 1 R as a calculator
#------------------
# Airthmetic
2+3
2-3
2*3
2/3
2^3
log(2)
exp(2)
abs(2)
sqrt(2)
#create objects
obj1=2
obj1
#multiply value of object 1 by 3
obj1*3
# create new object that stores object1*3
obj2=obj1*3
obj2
# wrong multiplication
2+3*4
# correct way
(2+3)*4
#-------------------
# 2 Working directories
#-------------------
getwd()
setwd("C:\Users\jasht\Documents\MATH R CODE")
#-------------------
# 3 Data in R
#-------------------
# 3.1
# read contents of a csv file
anscombe1.df=read.csv(file.choose())
# get first 6 lines
head(anscombe1.df)
# view entire object
View(anscombe1.df) 
#---------------------
# 3.2 Data frames in R
# see names of the columns
names(anscombe1.df) 
# how to refer to individual columns
anscombe1.df$X1 
# refer to them by column index
anscombe1.df[,1]
#---------------------
# 4 Calculating summaries in R
#---------------------
# 4.1
# mean for first column
mean(anscombe1.df$X1)
# mean for second column
mean(anscombe1.df$Y1)
# standard deviation
sd(anscombe1.df$X1)
# variance for first column
var(anscombe1.df$X1)
# 5 number summary for first column
summary(anscombe1.df$X1)
# general summary
summary(anscombe1.df)  
#---------------------
# 4.2 operations on entire vectors
# multiply all values of first column by 2
anscombe1.df$X1a=anscombe1.df$X1*2 
head(anscombe1.df)
#---------------------
# 5 Basic plotting
#---------------------
# 5.1
# hisogram for first column
hist(anscombe1.df$X1)
# box plot for first column
boxplot(anscombe1.df$X1)
# scatterplot x1 x-axis and y1 in y-axis
plot(anscombe1.df$X1,anscombe1.df$Y1)  
  

  
