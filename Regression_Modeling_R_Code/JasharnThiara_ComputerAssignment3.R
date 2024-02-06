##########
# Jasharn Thiara
# TMATH 410, WINTER 2023
# Computer Assignment 3
# Jan 30, 2023
#####################
# Change working directory to class directory 
getwd()
setwd("C:/Users/jasht/Documents/MATH R CODE")
# Read in data and make dataframe called foot
foot.df=read.csv(file.choose())
# Create linear model
foot.lm=lm(Height~Shoe.Print, data=foot.df)
# Get summary
summary(foot.lm)
dim(foot.df)
# C2 Info for table
qt(0.975, 38)
# lower bound for intercept
80.930-(10.893*2.024394)
# upper bound for intercept
80.930+(10.893*2.024394)
#lower bound for slope
3.219-(0.374*2.024394)
#upper bound for slope
3.219+(0.374*2.024394)
##########################
# C3 calculate SST, SSR, SSE
y.bar=mean(foot.df$Height)
x.bar=mean(foot.df$Shoe.Print)
# SST
foot.sst=sum((foot.df$Height-y.bar)^2)
foot.sst
# Calculate fitted values
y.hat=foot.lm$fitted.values
# SSE
foot.sse=sum((foot.df$Height-y.hat)^2)
foot.sse
# SSR
foot.ssr=sum((y.hat-y.bar)^2)
foot.ssr
###########################
# C4 verify r^2
foot.ssr/foot.sst
# Is the same as R^2 in model summary
############################
# C5 verify that SSR+SSE = SST
verify=foot.ssr+foot.sse
verify
foot.sst
# is the same! 
############################
# C6 prediction interval
preddata=data.frame(Shoe.Print=sort(foot.df$Shoe.Print))
foot.pred=predict(foot.lm,interval = "prediction", newdata = preddata)
predIntervals=head(foot.pred)
predLB= 148.1572
# C7 confidence interval
confz.interval=predict(foot.lm, newdata=preddata,interval="confidence")
confIntervals=head(conf.interval)
confLB=157.0337
#############################
# C8
# Open graphics command
png(file="C:/Users/jasht/Documents/MATH R CODE/FootScatterzzz.png",height=480,width=480)
# set up plot
par(mfrow=c(1,1),mar=c(3.5,3.5,0.5,0.5),mgp=c(2.25,0.5,0), 
    las=1) 
plot(foot.df$Shoe.Print,foot.df$Height,xlab="Shoe print length (cm)", 
     ylab="Height (cm)",pch=16) 
#create lin
abline(foot.lm$coefficients,lwd=2)
# Adding prediction lines
lines(preddata$Shoe.Print,foot.pred[,2]) 
lines(preddata$Shoe.Print,foot.pred[,3]) 
# Adding Confidence lines
lines(preddata$Shoe.Print,confz.interval[,2]) 
lines(preddata$Shoe.Print,confz.interval[,3])
dev.off()
###################################
# C12 Predicting new values
# first calculate sigma hat
var1=(sum((foot.df$Height-y.hat)^2))/38
MSE=sqrt(var1)
# other useful calculation
var2=sum((foot.df$Shoe.Print-x.bar)^2)

preddata2=data.frame(Shoe.Print=c(15,24.1,28.2)) 
foot.pred2=predict(foot.lm,interval = "prediction", newdata = preddata2)
summary(foot.pred2)
# C13 explain reasoning for whether or not linear model is appropriate
# 15 is not appropriate because 15 is outside our domain of x values in our data
# however with 24.1 and 28.2 a linear model is appropriate since the domain of our data supports these x-values.
qt(0.975, 27)
0.613+(0.1610*qt(0.975,23))
0.613-(0.1610*qt(0.975,23))
-0.073-(0.1357*qt(0.975,23))
-0.073+(0.1357*qt(0.q
1-pt(-1.7797, 17)
pnorm(-1.7697, 17)

#lb
-77.630-(qt(0.975, 11)*8.63)
0.337-(qt(0.975, 11)*0.03)
  