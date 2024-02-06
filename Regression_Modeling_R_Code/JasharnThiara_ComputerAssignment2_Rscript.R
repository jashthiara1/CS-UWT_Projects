##########
# Jasharn Thiara
# TMATH 410, WINTER 2023
# Computer Assignment 2
# Jan 23, 2023
#####################

# Change working directory to class directory 
getwd()
setwd("C:/Users/jasht/Documents/MATH R CODE")
# Read in data and make dataframe called foot
foot.df=read.csv(file.choose())
###########################
# C1
# View first 6 lines of the data frame
head(foot.df)
#number of observations in the dataset
dim(foot.df)
###########################
# C6
# Open graphics command
png(file="C:/Users/jasht/Documents/MATH R CODE/FootScatter.png",height=480,width=480)
plot(foot.df$Shoe.Print,foot.df$Height,xlab="Shoe.Print (cm)",ylab="Height (cm)")
dev.off()
###########################
# C8
# Create linear model
foot.lm=lm(foot.df$Height~foot.df$Shoe.Print,data=foot.df)
# Get summary
summary(foot.lm)
###########################
# C11
# (All answers below are in cm)
# 95% confidence interval for intercept
# Lower Bound
80.930-(qt(0.975,38)*10.893)
# Upper Bound
80.930+(qt(0.975,38)*10.893)
# C12
# 95% confidence interval for slope
# Lower Bound
3.219-(qt(0.975,38)*0.374)
# Upper Bound
3.219+(qt(0.975,38)*0.374)
1-pt(1.0079)

