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
