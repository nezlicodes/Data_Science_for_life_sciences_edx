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