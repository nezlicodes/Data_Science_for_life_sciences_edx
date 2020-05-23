library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

set.seed(1);
n <- 1000
averages5 <- vector("numeric", n)
for (i in 1:n) {
  sample <- sample(x, 5)
  averages5[i] <- mean(sample)
}
hist(averages5)



set.seed(1)
averages50 <- vector("numeric", n)
for (i in 1:n) {
  sample <- sample(x, 50)
  averages50[i] <- mean(sample)
}
hist(averages50)

# For the last set of averages, the ones obtained from a sample size of 50, what proportion are between 23 and 25?
mean(averages50 <=25 ) - mean (averages50 <=23 )

# Note that you can use the function pnorm() to find the proportion of observations below a cutoff x given a normal distribution with
# mean mu and standard deviation sigma with pnorm(x, mu, sigma) or pnorm( (x-mu)/sigma ).
# What is the proportion of observations between 23 and 25 in a normal distribution with 
# average 23.9 and standard deviation 0.43?

pnorm(25,23.9, 0.43) - pnorm(23,23.9, 0.43)
