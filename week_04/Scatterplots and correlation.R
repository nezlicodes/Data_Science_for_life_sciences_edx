library(UsingR)

##Scatterplots and correlation
data("father.son")
x=father.son$fheight
y=father.son$sheight
plot(x,y,xlab="Father's height in inches",ylab="Son's height in inches",main=paste("correlation =",signif(cor(x,y),2)))


## Stratification
# The function below creates groups of sons that have father heights in common
groups <- split(y,round(x)) 
# Let's  plot them
boxplot(groups, xlab="father heights in inches", ylab="son heights in inches")
# What's the average height of sons that have fathers' heights = 72
mean(y[round(x) == 72])

##Bi-variate normal distribution
x=(x-mean(x))/sd(x)
y=(y-mean(y))/sd(y)
means=tapply(y,round(x*4)/4,mean)
fatherheights=as.numeric(names(means))
mypar2(1,1)
plot(fatherheights,means,ylab="average of strata of son heights",ylim=range(fatherheights))
abline(0,cor(x,y))


