library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

#View Data
View(x)

## Set the seed at a
set.seed(1)
## using a for loop, take a random sample of 5 mice 1,000 times. Save these averages.
n <- 1000
nulls <- vector("numeric", n)
for (i in 1:n) {
  control <- sample(x,5)
  nulls[i] <- mean(control)
}
nulls

## What proportion of these 1,000 averages are more than 1 gram away
## from the average of x ?
sum( nulls - mean(x) > 1) / n


## Same but for n = 10000 
set.seed(1)
n <- 10000
nulls <- vector("numeric", n)
for (i in 1:n) {
  control <- sample(x,5)
  nulls[i] <- mean(control)
}
nulls

## What proportion of these 1,000 averages are more than 1 gram away
## from the average of x ?
mean(abs( nulls - mean(x) )> 1)


set.seed(1)
n <- 1000
averages5 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,50)
  averages5[i] <- mean(X)
}
hist(averages5) ##take a look
mean( abs( averages5 - mean(x) ) > 1)



