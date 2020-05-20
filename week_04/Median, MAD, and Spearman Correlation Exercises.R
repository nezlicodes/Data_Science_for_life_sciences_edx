data(ChickWeight)
head(ChickWeight)
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time", direction="wide")
head(chick)
chick = na.omit(chick)

# Focus on the chick weights on day 4 (check the column names of chick and note the numbers). How much does the average of chick weights at day 4 increase if we add an outlier measurement of 3000 grams? Specifically, what is the average weight of the day 4 chicks, including the outlier chick, divided by the average of the weight of the day 4 chicks without the outlier. Hint: use c() to add a number to a vector.
day4 <- chick$weight.4
day4plus <- c(day4,3000)
wt.ration <- mean(day4plus)/mean(day4)
wt.ration


# In exercise 1, we saw how sensitive the mean is to outliers. Now let's see what happens when we use the median instead of the mean. Compute the same ratio, but now using median instead of mean. Specifically, what is the median weight of the day 4 chicks, including the outlier chick, divided by the median of the weight of the day 4 chicks without the outlier.
mad.ratio <- median(day4plus)/median(day4)
mad.ratio

# Now try the same thing with the sample standard deviation (the sd() function in R). Add a chick with weight 3000 grams to the chick weights from day 4. How much does the standard deviation change? What's the standard deviation with the outlier chick divided by the standard deviation without the outlier chick?


sd.ratio <- sd(day4plus)/sd(day4)
sd.ratio

# Compare the result above to the median absolute deviation in R, which is calculated with the mad() function. Note that the MAD is unaffected by the addition of a single outlier. The mad() function in R includes the scaling factor 1.4826, such that mad() and sd() are very similar for a sample from a normal distribution.
# What's the MAD with the outlier chick divided by the MAD without the outlier chick?

mad.ratio <- mad(day4plus)/mad(day4)
mad.ratio

# Our last question relates to how the Pearson correlation is affected by an outlier as compared to the Spearman correlation. The Pearson correlation between x and y is given in R by cor(x,y). The Spearman correlation is given by cor(x,y,method="spearman").
# Plot the weights of chicks from day 4 and day 21. We can see that there is some general trend, with the lower weight chicks on day 4 having low weight again on day 21, and likewise for the high weight chicks.
# Calculate the Pearson correlation of the weights of chicks from day 4 and day 21. Now calculate how much the Pearson correlation changes if we add a chick that weighs 3000 on day 4 and 3000 on day 21. Again, divide the Pearson correlation with the outlier chick over the Pearson correlation computed without the outliers.

plot(chick$weight.4, chick$weight.21)

plot(chick$weight.4,chick$weight.21, main="Plot of Day 4 and Day 21 with median lines")
abline(h=median(chick$weight.21), v=median(chick$weight.4))
cor(c(chick$weight.4,3000),c(chick$weight.21, 3000),method = "pearson")/cor(chick$weight.4,chick$weight.21,method = "pearson")
