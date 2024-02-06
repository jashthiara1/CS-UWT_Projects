##########
# Jasharn Thiara
# TMATH 410, WINTER 2023
# Computer Assignment 4
# Jan 30, 2023
#####################
# Change working directory to class directory 
getwd()
setwd("C:/Users/jasht/Documents/MATH R CODE")
# Read in data and make dataframe called foot
cdi.df=read.csv(file.choose())
#####################
# C1 
# make a new column for population density
cdi.df$PopDens=cdi.df$TotalPop/cdi.df$LandArea
# make a new column for crimes per every 1000 people 
cdi.df$PerThousCrimes=cdi.df$TotalSeriousCrime/cdi.df$TotalPop*1000 
# C2
# To change values to per capita is a good tool here to standardize the results to the environment.Values of income and high school diplomas can tell us alot of the area and
# it makes sense to turn this into per capita so are results are not skewed by a higher population in certain areas. 
# Population density also makes sense because it solves the same issue of having more crime simply because of a higher population. It also
# can look into crime based on how close people are together on average. 
# C3
# a).crime rate makes sense as the response variable, because the other variables such as personal income, population density, and diplomama percentage
# can give us an environemnt in which we can predict values of crime and seek to account for some of the variability.
# b). One relationship I expect is a lower diploma percentage to correlate to higher rates of serious crime. I believe education can play a big role on teenagers
# and whether or not they will engage in crime. I also expect lower crime rates in high income areas due to the idea there may be more police force. I also believe
# a high city population will correlate to more serious crimes, since these are typically cities and people are interacting more often. 
#############################
# C4 
# create a new data frame of the western region 
cdi4.df=cdi.df[cdi.df$Region==4,] 
# Open graphics command
png(file="C:/Users/jasht/Documents/MATH R CODE/Scatterzzz.png",height=700,width=700)
par(mfrow=c(2,3))
# X=per capita personal income (PerCapInc), Y= crime rate (PerThousCrimes) 
plot(cdi4.df$PerCapInc,cdi4.df$PerThousCrimes,xlab="Per Capita Personal Income", 
     ylab="Crime Rate per thousands",pch=16)
# X=population density, Y=crime rate 
plot(cdi4.df$PopDens,cdi4.df$PerThousCrimes,xlab="Population Density", 
     ylab="Crime Rate per thousands",pch=16)
# X=percentage of population with high school diploma (PercHS), Y=crime rate 
plot(cdi4.df$PercHS,cdi4.df$PerThousCrimes,xlab="Percantage of population with diploma", 
     ylab="Crime Rate per thousands",pch=16)
# X=per capita personal income, Y=population density 
plot(cdi4.df$PerCapInc,cdi4.df$PopDens,xlab="Per Capita Personal Income", 
     ylab="Population Density",pch=16)
# X=per capita personal income, Y=percentage of population with high school diploma
plot(cdi4.df$PerCapInc,cdi4.df$PercHS,xlab="Per Capita Personal Income", 
     ylab="Percantage of population with diploma",pch=16)
# X=population density, Y=percentage of population with high school diploma 
plot(cdi4.df$PopDens,cdi4.df$PercHS,xlab="Population Density", 
     ylab="Percantage of population with diploma",pch=16)

dev.off()
#########################
# C5 comments on patterns
# Some of the plots seems to have very poor correlation. Expecially x ~ diploma and y ~ crime rate, it seems that the correlation is very weak and there is no general trend
# for the points. Also in many plots there are large outliers that either are not following the trend of the data or simply have larger x and y values then the rest of the domain.

# c6
# create linear model
cdi4.lm=lm(PerThousCrimes~PerCapInc+PopDens+PercHS,data=cdi4.df)
summary(cdi4.lm)
dim(cdi4.df)

# calculating confidence bounds
# intercept lb
1.030e+02-(1.992997*1.705e+01)
# intercept ub
1.030e+02+(1.992997*1.705e+01)
# percap lb
1.772e-04-(4.875e-04*1.992997)
# percap ub
1.772e-04+(4.875e-04*1.992997)
# popdens lb 
2.932e-03-(1.992997*1.030e-03)
# popdense ub
2.932e-03+(1.992997*1.030e-03)
# perchs lb
-5.912e-01-(1.992997*2.416e-01)
# perchs ub
-5.912e-01+(1.992997*2.416e-01)

#c7 interpretation for each regression coefficient using base null hypothesis HP = 0
# intercept
2*(1-pt(6.038,73))
# value is less than 0.05 hence we reject the null hypothesis that the intercept is 0. The intercept is statistically significant.
# percapInc
2*(1-pt(0.364,73))
# value is 0.71 and larger than 0.05, hence we fail to reject the null hypothesis and fail to prove the coefficient is statistically significant
# popdens
2*(1-pt(2.845,73))
#value is less than 0.05 therefore we can reject the null hypothesis and say the coefficient is statistically significant.
# perchs
2*(pt(-2.447,73))
# value is 0.016 therefore we can reject the null hypothesis and say the coefficient is something other than 0 and statistically significant.
# 
########################
# C8
# setup
y.hat=cdi4.lm$fitted.values
y.bar=mean(cdi4.df$PerThousCrimes)
# SST
cdi4.sst=sum((cdi4.df$PerThousCrimes-y.bar)^2)
cdi4.sst
# SSE
cdi4.sse=sum((cdi4.df$PerThousCrimes-y.hat)^2)
cdi4.sse
# MSE -> SSE/DfE
cdi4.mse=cdi4.sse/73
cdi4.mse
# MSE is very different from R^2 and R^2a.It is a way we can calculate the average of the errors. by taking the SSE and dividing by the degree of freedom.
# R^2
cdi4.r2=1-(cdi4.sse/cdi4.sst)
cdi4.r2
# R^2 is something that can be used to see what proportion of the variability is acounted for. A value closer to 1 means a strong percent is explained by the model.
# while a value closer to 0 means the model is not very good at explaining the variability.
# adjusted r^2
cdi4.temp1=(cdi4.sse/73)
cdi4.temp2=(cdi4.sst/76)
cdi4.adjusted=1-(cdi4.temp1/cdi4.temp2)
cdi4.adjusted
# Adjust R^2 is very similar to R^2. Except it accounts for extra predictor variables. Often times more predictor variables can be addded and the R^2 will go up 
# regardless of whether or not the new predictor variable was a good choice. It does this by accounting for the degrees of freedom. 
############################
# C9 
# create a 1x2 multi panel graph 
# open up graphics
png(file="C:/Users/jasht/Documents/MATH R CODE/1x2graph.png",height=700,width=700)
par(mfrow=c(1,2))
boxplot(cdi4.lm$residuals,ylab="Residual values",col="grey")
qqnorm(cdi4.lm$residuals,pch=16,main="Residual values")
dev.off()
#########################
# C10 Describe the graphs
# 


# C11 Point and interval estimates
# structure data frame with appropriate values
preddata=data.frame(PopDens=c(900,10,10000),PercHS=c(75,80,72), 
                    PerCapInc=c(11000,19000,35000)) 
# create confidence interval 
confIntervals=predict(cdi4.lm,newdata=preddata,interval="confidence")
confIntervals
########################
# c12 conclusion
# The motivation of this analysis was to explain the variability in total serious crimes per 1000 thousand people while considering a number of factors (predictor variables).
# These predictor variables, high school graduation, population density, and income per capita, all create different environements where we can see how crimes reacts to these
# as a responese variable. In this anaylsis we first compared many of the predictor variables to one another. This gave us a general idea before we tackled the anaylsis 
# with everything accounted for. We also found confidence intervals of the coefficients and then used a confidence interval on specific points. 
# The linear model did not seem to be a very good fit, I say this because the R^2a was very low (0.1606) and many of our coefficients failed to prove statistically signficant.
# The variables that were significant were the intercept, population density, and diploma percentage, while income per capita was not significant.For higher population density there
# was a positive increase in crime, although very small. For higher diploma percents there was a decrease in crime, although small it was larger than the effect of density.
# Yes, I believe these results supported the inferences I had made before the analysis, that more education and less population density would decrease serious crimes.

# I did not expect income per capita to be not statistically significant. It was a prediction that more money available in the area would lessen crime, but it did not 
# end up having that effect. I believe this model would not be effective in a new country. It had a very low R^2 adjusted value and was not the best fit for even the
# particular country we looked at. I beleive this model is a good step for predicting crime in a country. Although the problem is complex and likely there are many 
# factors at play when looking into how crime can occur. The next steps would be to take these signficant predictors, try to account for outliers, and also search for 
# new predictors so we can account for more of the variability we see here. 

