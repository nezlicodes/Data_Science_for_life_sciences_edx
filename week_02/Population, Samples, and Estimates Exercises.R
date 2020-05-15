library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename) 

# Remove lines that contain missing values
dat <- na.omit( dat )

View(dat)

# Use dplyr to create a vector x with the body weight of all males on the control (chow) diet.
library(dplyr)
x <- filter(dat, Sex=="M" & Diet=="chow" ) %>% select(Bodyweight) %>% unlist
mean(x)
# Now use the rafalib package and use the popsd() function to compute the population standard deviation.
library(rafalib)
popsd(x)

# Set the seed at 1. Take a random sample  X  of size 25 from x
set.seed(1)
X <- sample(x, 25)
# What is the sample average?
mean(X)

# Use dplyr to create a vector y with the body weight of all males on the high fat hf) diet.
# What is this population's average?

y <- filter(dat, Sex=='M' & Diet=="hf") %>% select(Bodyweight) %>% unlist
mean(y)
# Now use the rafalib package and use the popsd() function to compute the population standard deviation.
popsd(y)
# Set the seed at 1. Take a random sample  Y  of size 25 from y.
# What is the sample average?

set.seed(1)
Y <- sample(y, 25)
mean(Y)
  
abs((mean(y)-mean(x)) - (mean(Y)-mean(X)))

# Repeat the above for females, this time setting the seed to 2.

x <- filter(dat, Sex=="F" & Diet=="chow" ) %>% select(Bodyweight) %>% unlist
mean(x)
# Now use the rafalib package and use the popsd() function to compute the population standard deviation.
library(rafalib)
popsd(x)

# Set the seed at 1. Take a random sample  X  of size 25 from x
set.seed(2)
X <- sample(x, 25)
# What is the sample average?
mean(X)

# Use dplyr to create a vector y with the body weight of all males on the high fat hf) diet.
# What is this population's average?

y <- filter(dat, Sex=='F' & Diet=="hf") %>% select(Bodyweight) %>% unlist
mean(y)
# Now use the rafalib package and use the popsd() function to compute the population standard deviation.
popsd(y)
# Set the seed at 1. Take a random sample  Y  of size 25 from y.
# What is the sample average?

set.seed(2)
Y <- sample(y, 25)
mean(Y)

abs((mean(y)-mean(x)) - (mean(Y)-mean(X)))

