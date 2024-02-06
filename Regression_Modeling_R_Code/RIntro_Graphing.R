##########
# Jasharn Thiara
# TMATH 410, WINTER 2023
# RIntro_Graphing
# Jan 8, 2023
##########
#--------------------
# 1. Boxplots
#--------------------
# create random set of 100 x variables
x.fake=rnorm(100,10,2)
# create fake set of y values with a random error component
y.fake=100-1.5*x.fake+rnorm(100,0,2)
#--------------------
# 1.1
# set up plotting window
par(mfrow=c(1,2),mar=c(3,3,0.5,0.5),mgp=c(2,0.5,0),las=1) 
# create vertical boxplots
boxplot(x.fake,ylab ="Fake x data")
boxplot(y.fake,ylab="Fake y data")
#--------------------
# 1.2 Horizontal boxplots
# set up plotting window
par(mfrow=c(1,2),mar=c(3,3,0.5,0.5),mgp=c(2,0.5,0),las=1)
# create horizontal boxplots
boxplot(x.fake,xlab ="Fake x data",horizontal = TRUE)
boxplot(y.fake,xlab="Fake y data",horizontal = TRUE)
#---------------------
# 1.3 colors
# set up plotting window
par(mfrow=c(1,2),mar=c(3,3,0.5,0.5),mgp=c(2,0.5,0),las=1)
# Add desired colors
boxplot(x.fake,xlab ="Fake x data",col="blue") 
boxplot(y.fake,xlab="Fake y data",col="springgreen")
#----------------------
# 2 Histograms
#----------------------
# 2.1
# set up plotting window
par(mfrow=c(1,2),mar=c(3,3,2,0.5),mgp=c(2,0.5,0),las=1) 
# create histograms
hist(x.fake,xlab ="Fake x data",col="purple", 
     main="These are fake data!")
hist(y.fake,xlab="Fake y data",col="magenta", 
     main="These also are fake data!")
#----------------------
# 3 QQ Plots
#----------------------
# 3.1 
# set up plotting window
par(mfrow=c(1,2),mar=c(3,3,2,0.5),mgp=c(2,0.5,0),las=1) 
qqnorm(x.fake,pch=16,main="Fake x data")
qqline(x.fake,lwd=2) 
qqnorm(y.fake,pch=16,main="Fake y data")
qqline(y.fake,lwd=2)
#----------------------
# 4 Scatterplots
#----------------------
# 4.1
# set up plotting window
par(mar=c(3,3,0.5,0.5),mgp=c(2,0.5,0),las=1)
# create scatter plot
plot(x.fake,y.fake,xlab ="Fake x data",ylab="Fake y data",pch=16)
#----------------------
# 4.2 colors with scatter plots
par(mar=c(3,3,0.5,0.5),mgp=c(2,0.5,0),las=1) 
plot(x.fake,y.fake,xlab ="Fake x data",ylab="Fake y data",pch=16,col="cyan") 
#----------------------
# 4.3 main argument
par(mar=c(3,3,2,0.5),mgp=c(2,0.5,0),las=1) 
plot(x.fake,y.fake,xlab ="Fake x data",ylab="Fake y data",pch=16,col="cyan", 
     main="Still fake data") 
#----------------------
# 5 add text to a plot
#----------------------
# 5.1
# set up plotting window
par(mar=c(3,3,2,0.5),mgp=c(2,0.5,0),las=1)
plot(x.fake,y.fake,xlab ="Fake x data", 
     ylab="Fake y data",pch=16,col="salmon", 
     main="Still fake data")
# add text
text(x=13,y=92,labels="Here is some text")
#----------------------
# 5.2 adding text to margins
par(mar=c(3,3,2,2),mgp=c(2,0.5,0),las=1) 
plot(x.fake,y.fake,xlab ="Fake x data", 
     ylab="Fake y data",pch=16,col="orange", 
     main="Still fake data") 
# note here we use mtext instead
mtext(side=4,line=0,text="Here is some text") 
#----------------------
# 5.3 make text parralel
par(mar=c(3,3,2,2),mgp=c(2,0.5,0),las=1) 
plot(x.fake,y.fake,xlab ="Fake x data", 
     ylab="Fake y data",pch=16,col="orange", 
     main="Still fake data") 
# to do this we set las = 0
mtext(side=4,line=0,text="Here is some text",las=0) 
#----------------------
# 6 adding points, lines, legends to a plot
#----------------------
# 6.1
par(mar=c(3,3,2,2),mgp=c(2,0.5,0),las=1) 
plot(x.fake,y.fake,xlab ="Fake x data", 
     ylab="Fake y data",pch=16,main="Still fake data with an extra fake 
point") 
# adding a turqoise points
points(x=9,y=80,pch=17,col="turquoise") 
#-----------------------
# 6.2 add a legend
par(mar=c(3,3,2,2),mgp=c(2,0.5,0),las=1) 
plot(x.fake,y.fake,xlab ="Fake x data", 
     ylab="Fake y data",pch=16,main="Still fake data")
points(x=9,y=80,pch=17,col="turquoise")
# add legend to top right
legend(x="topright",legend=c("FakeData","OneFakePt"), 
       pch=c(16,17),col=c("black","turquoise")) 
#------------------------
# 6.3 adding a line
par(mar=c(3,3,2,2),mgp=c(2,0.5,0),las=1) 
plot(x.fake,y.fake,xlab ="Fake x data", 
     ylab="Fake y data",pch=16,main="Still fake data")
# command for a line
abline(v=10,lwd=2)
#------------------------
# add a line defined by slope and intercept values
par(mar=c(3,3,2,2),mgp=c(2,0.5,0),las=1) 
plot(x.fake,y.fake,xlab ="Fake x data", 
     ylab="Fake y data",pch=16,main="Still fake data") 
# function to add slope line
abline(a=100,b=-1.5,lwd=2,col="blue") 




