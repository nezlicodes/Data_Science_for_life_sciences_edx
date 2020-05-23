library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

#View dataset
View(x)

##Average of weights
mean(x)

## Set the seed to 1
set.seed(1)

##  Take a random sample of size 5. 
y <- sample(x, 5)

## What is the absolute value of the difference between the average of
## the sample and the average of all the values?
abs(mean(x)-mean(y))

## Set the seed to 5
set.seed(5)

## Take a random sample of 5
z <- sample(x, 5)

## Absolute difference
abs(mean(x)-mean(z))
