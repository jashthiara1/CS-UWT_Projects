##########
# Jasharn Thiara and Xuanlin Liu 
# TMATH 410, WINTER 2023
# Project Analysis
# Jan 30, 2023

getwd()
setwd("Project")
# Read in data and make dataframe called stock
Stock.df=read.csv(file.choose())

############################################
# Note: 1 = south 2 = east 3 = north 4= west
############################################

# Apply fac function to our qualitative variable 
Stock.df$Region.fac=factor(Stock.df$Region)

#create linear model to test region as an interaction
stockInteraction.lm=lm(PriceChange~NetAssetChange*Region.fac+NetCashChange*Region.fac,data=Stock.df)
summary(stockInteraction.lm)
anova(stockInteraction.lm)

# We see that region is not significant as an interaction so we recreate model without the interaction
stock.lm=lm(PriceChange~NetAssetChange+NetCashChange+Region.fac,data=Stock.df)
summary(stock.lm)
###############################################################

# create scatter plots of response variable plotted against each predictor variable (excluding region)
# create models response ~ explanatory
Nac.lm=lm(PriceChange~NetAssetChange,Stock.df)
NCC.lm=lm(PriceChange~NetCashChange,Stock.df)
# create models explanatory ~explanatory
predictorVars.lm=lm(NetAssetChange~NetCashChange,Stock.df)
predictorVars2.lm=lm(NetCashChange~NetAssetChange,Stock.df)

#Set up panel
png(file="C:/Users/jasht/Documents/TMATH410/Project/ScatterplotsSTOCKSResponse.png",height=300,width=700)
par(mfrow=c(1,2))

# Price change ~ Net Asset Change
plot(Stock.df$PriceChange,Stock.df$NetAssetChange,xlab="Net Asset Change (%)", 
     ylab="Stock Price Change (%)",pch=16)
abline(Nac.lm$coefficients,lwd=2)

# Price change ~ Net Cash Change
plot(Stock.df$PriceChange,Stock.df$NetCashChange,xlab="Net Cash Change (%)", 
     ylab="Stock Price Change (%)",pch=16)
abline(NCC.lm$coefficients,lwd=2)
dev.off()
###############################################################
#Create scatter plots of explanatory variables against each other (excluding region)

# set up panel
png(file="C:/Users/jasht/Documents/TMATH410/Project/ScatterplotsSTOCKSEXPLANATORY.png",height=300,width=700)
par(mfrow=c(1,2))

# Net Asset Change ~ Net Cash Change
plot(Stock.df$NetAssetChange,Stock.df$NetCashChange,xlab="Net Cash Change (%)", 
     ylab="Net Asset Change (%)",pch=16)
abline(predictorVars.lm$coefficients,lwd=2)

# Net Cash Change ~ Net Asset Change
plot(Stock.df$NetCashChange,Stock.df$NetAssetChange,xlab="Net Asset Change (%)", 
     ylab="Net Cash Change (%)",pch=16)
abline(predictorVars.lm$coefficients,lwd=2)
dev.off()
###############################################################

# Plot of residuals, includes Residuals vs Fitted, Normal Q-Q, Standardized Residuals, and Residuals vs Leverage
png(file="C:/Users/jasht/Documents/TMATH410/Project/Residuals.png",height=600,width=600)
par(mfrow=c(2,2))
plot(stock.lm)
dev.off()

# In an attempt to remedy the right skewed results in residuals, we will transform the response variable.

png(file="C:/Users/jasht/Documents/TMATH410/Project/logResidualsS.png",height=600,width=600)

Stock.df$log.PriceChange=log(Stock.df$PriceChange+0.41)
logStock.lm=lm(log.PriceChange~NetAssetChange+NetCashChange+Region.fac,data=Stock.df)
par(mfrow=c(2,2))
plot(logStock.lm)
dev.off()

# we end up with a even more skewed distribution (can be seen in the Q-Q plot), so we try another 
# transformation using square root on the response variable.

png(file="C:/Users/jasht/Documents/TMATH410/Project/SqRootResidualsS.png",height=600,width=600)
Stock.df$squareroot.PriceChange=sqrt(Stock.df$PriceChange+0.41)
squarerootStock.lm=lm(squareroot.PriceChange~NetAssetChange+NetCashChange+Region.fac,data=Stock.df)
par(mfrow=c(2,2))
plot(logStock.lm)
dev.off()

# Again we end up with a more skewed plot distribution (can be seen in the Q-Q plot)
# We decide to stick with original model (un-transformed).
###############################################################

#analyze VIF for net asset change
#VIF for netCashChange
NACVif.lm=lm(Stock.df$NetAssetChange~Stock.df$NetCashChange+Stock.df$Region,data=Stock.df)
summary(NACVif.lm)
NACvif = 1/(1-0.07272)
NACvif

# analyze VIF for net cash change
NCC.lm=lm(Stock.df$NetCashChange~Stock.df$NetAssetChange+Stock.df$Region,data=Stock.df)
summary(NCC.lm)
NCCvif = 1/(1-0.07591)
NCCvif
# does not show sever multi-collinearity or simulatneous multicollinearities, since both vifs were < 2

# The realization was made that the residuals vs leverage already determines the cooks distance, thus we did not add it in the report
# but it is here for reference.
# Cooks distance
stock.cooks=cooks.distance(stock.lm) 
# Index plot
par(mfrow=c(1,1),mar=c(3.5,3.5,0.5,0.5),mgp=c(2.5,0.5,0),las=1) 
plot(stock.cooks,ylab="Cook's distance") 
# draw line
abline(h=c(1,2),lty=2)


# extract rows that are flagged in the cooks distance graph
# this is the outlier since it has a positive 112% stock price gain in a domain of observations that decline in stock price %.
Stock.df[c(30),]

# we decide to keep this outlier because it reflects the unpredictability of the stock market
# Our final model is the one from the beginning. 
# lm(PriceChange~NetAssetChange+NetCashChange+Region.fac,data=Stock.df)
summary(stock.lm)

###########################################





