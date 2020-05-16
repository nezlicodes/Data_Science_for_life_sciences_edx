library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- na.omit( read.csv(filename) )

?pnorm
# If a list of numbers has a distribution that is well approximated by the normal distribution,
# what proportion of these numbers are within one standard deviation away from the list's average?

View(dat)
pnorm(1)-pnorm(-1)


#What proportion of these numbers
# are within two standard deviations away from the list's average?
pnorm(2)-pnorm(-2)

# What proportion of these numbers are within three standard deviations away from the list's average?
pnorm(3)-pnorm(-3)

# Define y to be the weights of males on the control diet.
# What proportion of the mice are within one standard deviation away from the average weight?

library(dplyr)
library(rafalib)
y <- filter(dat, Sex=='M' & Diet=='chow') %>% select(Bodyweight) %>% unlist
mean(y<=(mean(y)+3*popsd(y)))-mean(y<=(mean(y)-3*popsd(y)))


set.seed(1)
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)
mean(avgs)
popsd(avgs)
