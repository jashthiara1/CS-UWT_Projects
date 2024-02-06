##########
# Jasharn Thiara
# TMATH 410, WINTER 2023
# Computer Assignment 5
# Febuary 20, 2023
#####################

# Change working directory to class directory 
getwd()
setwd("C:/Users/jasht/Documents/MATH R CODE")
# Read in data and make dataframe called cdi
cdi.df=read.csv(file.choose())
# verify dataframe has 13 columns and 440 rows.
dim(cdi.df)
########################
# Set up
# create populaion density and crimes per 1000 columns  
cdi.df$PopDens=cdi.df$TotalPop/cdi.df$LandArea 
cdi.df$PerThousCrimes=cdi.df$TotalSeriousCrime/cdi.df$TotalPop*1000 
cdi4.df=cdi.df[cdi.df$Region==4,] 
# rename rows
rownames(cdi4.df)=1:nrow(cdi4.df) 
# create linear model 
cdi4.lm=lm(PerThousCrimes~PerCapInc+PopDens+PercHS,data=cdi4.df) 
##########################
# C2 create leverage variables
cdi4.infl=influence(cdi4.lm) 
cdi4.infl$hat
# C3
# store results
cdi4.lm.sum=summary(cdi4.lm) 
attributes(cdi4.lm.sum) 
# calculate standardized residuals
cdi4.stdRes=rstandard(cdi4.lm) 
# create qq and box plot
png(file="C:/Users/jasht/Documents/TMATH410/MATH R CODE/plotsCA5.png",height=700,width=700)
par(mfrow=c(1,2))
boxplot(cdi4.stdRes,ylab="Standardized Residual values",col="grey")
qqnorm(cdi4.stdRes,pch=16,main="Standardized Residual values")
dev.off()
###############################
# C5 create scatter plots of the standardized residual values against each of the predictor variables
png(file="C:/Users/jasht/Documents/TMATH410/MATH R CODE/ScatterplotsCA5.png",height=700,width=700)
par(mfrow=c(2,2))
plot(cdi4.df$PerCapInc,cdi4.stdRes,xlab="Per Capita Personal Income", 
     ylab="Standardized Residuals",pch=16)
plot(cdi4.df$PopDens,cdi4.stdRes,xlab="Population Density", 
     ylab="Standardized Residuals",pch=16)
plot(cdi4.df$PercHS,cdi4.stdRes,xlab="Highschool Diplomas", 
     ylab="Standardized Residuals",pch=16)
plot(cdi4.lm$fitted.values,cdi4.stdRes,xlab="Fitted Values", 
     ylab="Standardized Residuals",pch=16)
dev.off()
#################################
# C7 Cooks distance
png(file="C:/Users/jasht/Documents/TMATH410/MATH R CODE/CooksDCA5.png",height=700,width=700)
cdi4.cooks=cooks.distance(cdi4.lm) 
# Index plot
par(mfrow=c(1,1),mar=c(3.5,3.5,0.5,0.5),mgp=c(2.5,0.5,0),las=1) 
plot(cdi4.cooks,ylab="Cook's distance") 
# draw line
abline(h=c(1,2),lwd=2) 
dev.off()
###################################
# C9
# Create residual plots
par(mfrow=c(2,2),mar=c(3.5,3.5,1.5,0.5),mgp=c(2.5,0.5,0),las=1) 
plot(cdi4.lm) 
# C11 extract rows that are flagged in the cooks distance graph
cdi4.df[c(15),] 
