##########
# Jasharn Thiara
# TMATH 410, WINTER 2023
# Computer Assignment 6
# March 5, 2023
#####################

# Change working directory to class directory 
getwd()
setwd("C:/Users/jasht/Documents/TMath410/MATH R CODE")
# Read in data and make dataframe called cdi
senic.df=read.csv(file.choose())
# verify dataframe has 7 columns and 113 rows.
dim(senic.df)
# code medSchAff as factor
senic.df$MedSchAff=factor(senic.df$MedSchAff) 
# c2
# create medSchAff column
summary(senic.df$MedSchAff)
# c3 
png(file="C:/Users/jasht/Documents/TMATH410/MATH R CODE/plotCA6.png",height=700,width=700)
par(mfrow=c(1,1))
plot(senic.df)
dev.off()
# c4 
# model that predicts infection risk as linear combination of quantitative variables.
senic1.lm=lm(InfectionRisk~LenStay+NumBeds+PatientsPerDay+NumNurse, 
             data=senic.df) 
car::vif(senic1.lm) 
##############################
# C6
# new linear model that predicts InfectionRisk by a linear combination of LenStay, Age, 
#and PatientsPerNurse
senic.df$PatientsPerNurse=senic.df$PatientsPerDay/senic.df$NumNurse
senic2.lm=lm(InfectionRisk~LenStay+Age+PatientsPerNurse, 
             data=senic.df)
car::vif(senic2.lm)
summary(senic2.lm)
##############################
# newlinear model that includes the main effects of length of stay, patients per nurse, and 
# medical school affiliation, and interactions between medical school affiliation and length of stay and 
# medical school affiliation and patients per nurse. 
senic2.lm=lm(InfectionRisk~LenStay*MedSchAff+ 
               PatientsPerNurse*MedSchAff,data=senic.df) 
# Perform analysis of variance
anova(senic2.lm) 
##############################
# C10
# calculate standardized residuals
senic2.stdRes=rstandard(senic2.lm) 
# create qq and box plot
png(file="C:/Users/jasht/Documents/TMATH410/MATH R CODE/resplotsCA6.png",height=700,width=700)
par(mfrow=c(2,3))
boxplot(senic2.stdRes,ylab="Standardized Residual values",col="grey")
qqnorm(senic2.stdRes,pch=16,main="Standardized Residual values")
plot(senic.df$LenStay,senic2.stdRes,xlab="length of stay", 
     ylab="Standardized Residuals",pch=16)
plot(senic.df$PatientsPerNurse,senic2.stdRes,xlab="patients per nurse", 
     ylab="Standardized Residuals",pch=16)
plot(senic.df$MedSchAff,senic2.stdRes,xlab="Medical school affiliation", 
     ylab="Standardized Residuals",pch=16)
plot(senic2.lm$fitted.values,senic2.stdRes,xlab="Fitted Values", 
     ylab="Standardized Residuals",pch=16)
dev.off()

