##########
# Jasharn Thiara
# TMATH 410, WINTER 2023
# Dougfir
# Jan 8, 2023
##########

# Sample 1
dougFir1.df=data.frame(dbh=c(5.47,41.39,3.35,42.85,31.68,21.39,46.03,68.88,32.08,63.86),
                       height=c(8.7,23.4,7.3,26.6,18.8,16,27.5,38.4,20.4,31.9))
View(dougFir1.df)
plot(dougFir1.df$dbh,dougFir1.df$height)
dougFir1.lm=lm(height~dbh,data=dougFir1.df)
dougFir1.lm$coefficients
abline(dougFir1.lm$coefficients,lwd=2)

#######
# sample 2
dougFir2.df=data.frame(dbh=c(22.57,21.21,25.79,57.11,32.74,46.84,33.72,13.98,53.9,25.82),
                       height=c(13.2,13.4,13.9,30.6,18.7,26.5,20.9,8.9,29.6,16.2))
View(dougFir2.df)
plot(dougFir2.df$dbh,dougFir2.df$height)
dougFir2.lm=lm(height~dbh,data=dougFir2.df)
dougFir2.lm$coefficients
abline(dougFir2.lm$coefficients,lwd=2)

#######
# sample 3
dougFir3.df=data.frame(dbh=c(39.66,5.27,11.91,54.15,12.61,26.05,66.78,47.74,43.31,11.42),
                       height=c(23.2,5.4,10.9,33.2,11.8,11.7,34.5,25.5,23.6,8.1))
View(dougFir3.df)
plot(dougFir3.df$dbh,dougFir3.df$height)
dougFir3.lm=lm(height~dbh,data=dougFir3.df)
dougFir3.lm$coefficients
abline(dougFir3.lm$coefficients,lwd=2)

pred.df=data.frame(dbh=seq(0,65,0.1))
head(pred.df)

# now we make the prediction interval using the predict function
conf.interval=predict(dougFir3.lm, newdata=pred.df,interval="confidence")
head(conf.interval)
#and add the prediction interval lines to your plot
lines(pred.df$dbh,conf.interval[,2], col="blue")
lines(pred.df$dbh,conf.interval[,3], col="blue")
# true regression line 
abline(3,0.5,lty=2)
